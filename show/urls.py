from django.conf.urls import url
from show.views import teacher_view

urlpatterns = [
    url(r'^student/edit/([0-9]+)/$',teacher_view.student_edit),
    url(r'^student/delete/',teacher_view.student_delete),
    url(r'^student/add/',teacher_view.student_add),
    url(r'^student/detail_list/',teacher_view.student_detail_list),

    url(r'^homework/',teacher_view.homework),
    url(r'^pass_homework/([0-9]+)/$',teacher_view.pass_homework),

]