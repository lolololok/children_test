"""python_tx晨检 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from show import views
from show import urls as show_urls

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^login/', views.login),
    url(r'^check_login/', views.check_login),
    url(r'^manager_page/', views.manager_page),
    url(r'^teacher_page/', views.teacher_page),
    url(r'^student_page/', views.student_page),
    url(r'^teacher/', include(show_urls)),
    url(r'^logout/', views.logout),
    url(r'^accountcheck/', views.accountcheck),
    url(r'^repassword/', views.repassword),
    url(r'^repassword_check/', views.repassword_check),
]
