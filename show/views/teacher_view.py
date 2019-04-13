import copy
from django.shortcuts import HttpResponse,redirect,render
from django.http import JsonResponse
from django.db.models import Q
from show import models
from show.utils.page import Pagination



def teacher_page(request):
    '''
    :param request:
    :return: 老师界面
    '''
    student_list = []
    permission_list = []
    cid = request.session.get('user_id','')
    if cid:
        try:
            request.session['url'] = request.path
            teacher_obj = models.Teacher.objects.filter(account_id=cid).first()
            class_objs = models.Class.objects.filter(teacher=teacher_obj.pk)
            class_list_obj = copy.deepcopy(class_objs)
            class_id = request.GET.get('class_id','')
            if class_id:
                class_objs = models.Class.objects.filter(pk=class_id)
            permission_querysets = models.Teacher.objects.filter(pk=teacher_obj.pk).values('role__permission__name').distinct()
            for permission in permission_querysets:
                permission_list.append(permission['role__permission__name'])
            class_filter = Q()
            class_filter.connector = 'OR'
            for class_obj in class_objs:
                class_filter.children.append(('classes',class_obj))
            student_list = models.Student.objects.filter(class_filter)
            # search(request,student_list)
            pagination = Pagination(request.GET.get('page',1),student_list.count(),request.path,request.GET,per_page_num=10,pager_count=5)
            student_list = student_list[pagination.start:pagination.end]
            return render(request,'teacher_page.html',locals())
        except Exception as e:
            return HttpResponse("资源不存在！")
    return render(request,'login.html')



def student_edit(request,sid):
    '''
    :param request:
    :param sid: 学生id
    :return: 学生编辑页面
    '''
    try:
        student_obj = models.Student.objects.filter(pk=sid).first()
        school_id = models.Student.objects.filter(pk=sid).values('classes__school_id')
        classes_obj = models.Class.objects.filter(school_id = school_id)
        if request.method == 'POST':
            name = request.POST.get('user')
            class_id = request.POST.get('class_id')
            classes_obj = models.Class.objects.get(pk=class_id)
            obj = models.Student.objects.get(pk=sid)
            obj.name = name
            obj.classes = classes_obj
            obj.save()
            return redirect('/teacher_page/')
        return render(request,'student_edit.html',locals())
    except Exception as e:
        return HttpResponse("资源不存在！")

def student_delete(request):
    '''
    :param request:
    :return: 老师主页面
    '''
    try:
        sid = request.GET.get('student_id')
        account_id = models.Student.objects.filter(pk = sid).values('account_id')
        models.Account.objects.filter(pk = account_id).delete()
        models.Student.objects.filter(pk=sid).delete()
        url = '/teacher_page/'
        return HttpResponse(url)
    except Exception as e:
        return HttpResponse("删除出错")

def student_add(request):
    '''
    :param request:
    :return: 学生添加页面
    '''
    cid = request.session.get('user_id','')
    try:
        tid = models.Teacher.objects.filter(account_id=cid).first().pk
        class_objs = models.Class.objects.filter(teacher=tid)
        if request.method == 'POST':
            name = request.POST.get('user')
            account = request.POST.get('account')
            pwd = request.POST.get('pwd')
            class_id = request.POST.get('class_id')
            ret = models.Account.objects.create(account=account,password=pwd)
            role_obj = models.Role.objects.get(pk = 2)
            class_obj = models.Class.objects.get(pk = class_id)
            models.Student.objects.create(name=name,account=ret,classes=class_obj,role=role_obj)
            return redirect('/teacher_page/')
        return render(request,'student_add.html',locals())
    except Exception as e:
        return HttpResponse("添加失败")

def student_detail_list(request):
    '''
    :param request:
    :return: 学生详情列表
    '''
    if request.method == "GET":
        cid = request.session.get("user_id")
        try:
            class_id = models.Teacher.objects.filter(account_id=cid).first().manager_class_id
            student_obj_list = models.Student.objects.filter(classes_id=class_id).all()
            return render(request,'student_detail_list.html',locals())
        except Exception as e:
            return HttpResponse("资源不存在！")


def homework(request):
    '''
    :param request:
    :return:布置家庭作业页面
    '''
    cid = request.session.get('user_id', '')
    try:
        tid = models.Teacher.objects.filter(account_id=cid).first().pk
        class_obj = models.Class.objects.filter(teacher=tid)
        temp = []
        if request.method == 'POST':
            title = request.POST.get('title')
            content = request.POST.get('content')
            classes = request.POST.getlist('class')
            delaydata = request.POST.get('data')
            class_objs = models.Class.objects.filter(id__in = classes)
            obj = models.Homework.objects.create(title=title,content=content,teacher_id=tid,delay_time=delaydata)
            obj.classes.add(*classes)
            return redirect('/teacher_page/')
        return render(request,'homework.html',locals())
    except Exception as e:
        return HttpResponse("资源不存在！")

def pass_homework(request,teacher_id):
    '''
    :param request:
    :param teacher_id: 老师id
    :return: 往期布置作业的页面
    '''
    try:
        homework_list = models.Homework.objects.filter(teacher_id=teacher_id)
        if request.method == "POST":
            homework_id = request.POST.get('homework_id')
            ret = models.Homework.objects.filter(pk=homework_id).delete()
            if ret:
                res = {"state":1000}
                return JsonResponse(res)
            else:
                return HttpResponse('错误请求')
        return render(request,'pass_homework.html',locals())
    except Exception as e:
        return HttpResponse("资源不存在！")


def accountcheck(request):
    '''
    :param request:
    :return: 提示信息
    '''
    msg = {"state":False,'warring':""}
    account = request.GET.get('account')
    try:
        ret = models.Account.objects.filter(account=account)
        if ret:
            msg["state"] = True
            msg["warring"] = '用户已存在'
        return JsonResponse(msg)
    except Exception as e:
        return HttpResponse("出错了。。。")