from django.shortcuts import render
from show import models
from django.shortcuts import HttpResponse,redirect,render
from django.http import JsonResponse
from show import models
from show.utils.page import Pagination
# Create your views here.

def login(request):
    if request.method == 'POST':
        msg = {'state':'','msg':'','page':''}
        account = request.POST.get('user')
        pwd = request.POST.get('pwd')
        ret = models.Account.objects.filter(account=account, password=pwd).first()
        if ret:
            request.session['account'] = account
            request.session['user_id'] = ret.pk
            if models.Manager.objects.filter(account=ret):
                msg['state'] = True
                msg['page'] = 'm'
            elif models.Teacher.objects.filter(account=ret):

                msg['state'] = True
                msg['page'] = 't'
            elif models.Student.objects.filter(account=ret):
                sid = models.Student.objects.filter(account_id=ret.pk).first().pk
                print(sid)
                msg['state'] = True
                msg['page'] = 's'
                msg['sid'] = sid
            else:
                msg['state'] = False
                msg['msg'] = '密码不正确'
        else:
            msg['msg'] = '密码不正确'
            msg['state'] = False
        return JsonResponse(msg)
    return render(request,'login.html')

def logout(request):
    request.session.flush()
    return render(request,'login.html')

def check_login(request):
    res = {'msg':'','state':''}
    inputdate = request.GET.get('input_date')
    ret = models.Account.objects.filter(account=inputdate)
    if ret:
        res['state'] = True
    else:
        res['msg'] = '用户不存在'
        res['state'] = False
    return JsonResponse(res)

def repassword(request):
    path = request.session.get('url')
    user_id = request.session.get('user_id','')
    msg = {'warring':'','state':True}
    if request.method == 'POST':
        npwd = request.POST.get('npwd')
        rnpwd = request.POST.get('rnpwd')
        if npwd == rnpwd:
            msg['state'] = False
            user_obj = models.Account.objects.get(pk=user_id)
            user_obj.password = rnpwd
            user_obj.save()
        else:
            msg['warring'] = '两次密码不一致'
        return JsonResponse(msg)
    return render(request,'repassword.html',locals())

def repassword_check(request):
    msg = {'state':True,'warring':''}
    opwd = request.GET.get('opwd')
    user_id = request.session.get('user_id','')
    if not models.Account.objects.filter(pk=user_id,password=opwd):
        msg['state'] = False
        msg['warring'] = '密码不正确'
    return JsonResponse(msg)


def manager_page(request):
    return HttpResponse("M")


# def search(request,list):
#     search = request.POST.get('search')
#     import re
#     for item in list:
#         name = item.name
#         account = item.account.account
#         re_path = '.*%s.*'%search
#         ret = re.findall(re_path,item)


import copy
from django.db.models import Q
def teacher_page(request):
    student_list = []
    permission_list = []
    cid = request.session.get('user_id','')
    if cid:
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
    return render(request,'login.html')



# from django.forms import ModelForm
# class StudentForm(ModelForm):
#     class Meta:
#         model = models.Student
#         fields = '__all__'
def student_edit(request,sid):
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

def student_delete(request):
    sid = request.GET.get('student_id')
    account_id = models.Student.objects.filter(pk = sid).values('account_id')
    models.Account.objects.filter(pk = account_id).delete()
    models.Student.objects.filter(pk=sid).delete()
    url = '/teacher_page/'
    return HttpResponse(url)

def student_add(request):
    cid = request.session.get('user_id','')
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

def student_detail_list(request):
    if request.method == "GET":
        cid = request.session.get("user_id")
        class_id = models.Teacher.objects.filter(account_id=cid).first().manager_class_id
        student_obj_list = models.Student.objects.filter(classes_id=class_id).all()
        return render(request,'student_detail_list.html',locals())

def student_detail(request,sid):
    return render(request,"student_page.html")

def accountcheck(request):
    msg = {"state":False,'warring':""}
    account = request.GET.get('account')
    ret = models.Account.objects.filter(account=account)
    if ret:
        msg["state"] = True
        msg["warring"] = '用户已存在'
    return JsonResponse(msg)


def homework(request):
    cid = request.session.get('user_id', '')
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

def pass_homework(request,teacher_id):
    homework_list = models.Homework.objects.filter(teacher_id=teacher_id)
    if request.method == "POST":
        homework_id = request.POST.get('homework_id')
        ret = models.Homework.objects.filter(pk=homework_id).delete()
        if ret:
            return render(request, 'pass_homework.html',locals())
        else:
            return HttpResponse('错误请求')
    return render(request,'pass_homework.html',locals())




