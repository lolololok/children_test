from django.http import JsonResponse
from django.shortcuts import render,HttpResponse
from show import models



def login(request):
    '''
    :param request:
    :return 根据登录人不同返回不同的页面:
    '''
    if request.method == 'POST':
        msg = {'state':'','msg':'','page':''}
        account = request.POST.get('user')
        pwd = request.POST.get('pwd')
        try:
            ret = models.Account.objects.filter(account=account, password=pwd).first()
            if ret:
                request.session['account'] = account
                request.session['user_id'] = ret.pk
                if models.Manager.objects.filter(account=ret):
                    msg['state'] = True
                    msg['page'] = 'm'
                    request.session['role'] = 'm'
                elif models.Teacher.objects.filter(account=ret):

                    msg['state'] = True
                    msg['page'] = 't'
                    request.session['role'] = 't'
                elif models.Student.objects.filter(account=ret):
                    sid = models.Student.objects.filter(account_id=ret.pk).first().pk
                    msg['state'] = True
                    msg['page'] = 's'
                    msg['sid'] = sid
                    request.session['role'] = 's'
                else:
                    msg['state'] = False
                    msg['msg'] = '密码不正确'
            else:
                msg['msg'] = '密码不正确'
                msg['state'] = False
            return JsonResponse(msg)
        except Exception as e:
            return HttpResponse("资源未找到")
    return render(request,'login.html')


def logout(request):
    '''
    :param request:
    :return:登录页面
    '''
    request.session.flush()
    return render(request,'login.html')


def check_login(request):
    '''
    :param request:
    :return: 提示信息
    '''
    res = {'msg':'','state':''}
    inputdate = request.GET.get('input_date')
    try:
        ret = models.Account.objects.filter(account=inputdate)
        if ret:
            res['state'] = True
        else:
            res['msg'] = '用户不存在'
            res['state'] = False
        return JsonResponse(res)
    except Exception as e:
        return HttpResponse("资源不存在！")


