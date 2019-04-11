from django.test import TestCase

# Create your tests here.




def foo(action = None,**kwargs):
    print(action)
    print(kwargs)
foo({'a':1,'b':2})
foo(**{'a':1,'b':2})
foo(a = 1,b = 2)
foo(a = 1)
foo(action=3,a =1,b =2)
