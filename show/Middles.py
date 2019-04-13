from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import HttpResponse
import re
URL = ['/login/','/admin/.*','/check_login/','/index/']
class RequestAllow(MiddlewareMixin):
    def process_request(self,request):
        current_path = request.path
        for valid_url in URL:
            ret = re.match(valid_url,current_path)
            if ret:
                return None
        else:
            if request.session.get('user_id',''):
                return
            else:
                return HttpResponse('页面不存在！')