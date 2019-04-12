from django.conf.urls import url
from show import views

urlpatterns = [
    url(r'^student/edit/([0-9]+)/$',views.student_edit),
    url(r'^student/delete/',views.student_delete),
    url(r'^student/add/',views.student_add),
    url(r'^homework/',views.homework),
    url(r'^pass_homework/([0-9]+)/$',views.pass_homework),
    url(r'^student/detail_list/',views.student_detail_list)
]