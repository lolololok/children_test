from django.shortcuts import render,HttpResponse
from django.http import JsonResponse
from show import models




def student_detail(request,sid):
    '''
    :param request:
    :param sid:学生id
    :return: 学生界面
    '''
    request.session['url'] = request.path
    role = request.session.get('role')
    try:
        stdent = models.Student.objects.filter(pk = sid).values("name","classes_id").first()
        homework_obj_list = models.Homework.objects.filter(classes=stdent["classes_id"]).all()
        sign_time = models.Sign.objects.filter(student=sid).values("create_time","pk")
        sign_id = max([int(i["pk"]) for i in sign_time])
        if request.method == "POST":
            sign_id = request.POST.get("sign_id")
            sign = models.Sign.objects.filter(pk=sign_id).first()
            import datetime
            ret = {"height":sign.height,"weight":sign.weight,
                   "temperature":sign.temperature,"time":datetime.datetime.strftime(sign.create_time,"%Y-%m-%d %H:%M:%S")}
            return JsonResponse(ret)
        sign = models.Sign.objects.filter(pk=sign_id).first()
        return render(request,"student_page.html",locals())
    except Exception as e:
        return HttpResponse("资源不存在！")

