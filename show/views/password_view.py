from django.http import JsonResponse
from django.shortcuts import render,HttpResponse
from show import models



def repassword(request):
    '''
    :param request:
    :return: 提示信息和修改密码页面
    '''
    path = request.session.get('url')
    user_id = request.session.get('user_id','')
    msg = {'warring':'','state':True}
    if request.method == 'POST':
        try:
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
        except Exception as e:
            return HttpResponse("资源不存在！")
    return render(request,'repassword.html',locals())

def repassword_check(request):
    '''
    :param request:
    :return: 提示信息
    '''
    msg = {'state':True,'warring':''}
    opwd = request.GET.get('opwd')
    user_id = request.session.get('user_id','')
    try:
        if not models.Account.objects.filter(pk=user_id,password=opwd):
            msg['state'] = False
            msg['warring'] = '密码不正确'
        return JsonResponse(msg)
    except Exception as e:
        return HttpResponse("资源不存在！")