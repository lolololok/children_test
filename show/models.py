# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Manager(models.Model):
    name = models.CharField(max_length=20,null=False)
    account = models.ForeignKey(to='Account')
    create_time = models.DateTimeField(auto_now_add=True)
    role = models.ManyToManyField(to='Role')
    def __str__(self):
        return self.name

class Class(models.Model):
    name = models.CharField(max_length=20,null=False)
    teacher = models.ManyToManyField(to='Teacher')
    create_time = models.DateTimeField(auto_now_add=True)
    school = models.ForeignKey(to='School')
    def __str__(self):
        return self.name



class Student(models.Model):
    name = models.CharField(max_length=20,null=False)
    account = models.ForeignKey(to='Account')
    create_time = models.DateTimeField(auto_now_add=True)
    classes = models.ForeignKey(to='Class')
    role = models.ForeignKey(to='Role')
    img_a = models.CharField(max_length=64,default=None)
    def __str__(self):
        return self.name

class Teacher(models.Model):
    name = models.CharField(max_length=20, null=False)
    account = models.ForeignKey(to='Account')
    create_time = models.DateTimeField(auto_now_add=True)
    role = models.ManyToManyField(to='Role')
    manager_class_id = models.IntegerField(null=True,default=None)
    def __str__(self):
        return self.name


class Homework(models.Model):
    title = models.CharField(max_length=20)
    teacher = models.ForeignKey(to='Teacher')
    content = models.CharField(max_length=300)
    classes = models.ManyToManyField(to='Class')
    create_time = models.DateTimeField(auto_now_add=True)
    delay_time = models.DateTimeField()
    def __str__(self):
        return self.title


class School(models.Model):
    name = models.CharField(max_length=20)
    classes = models.IntegerField()
    create_time = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name



class Sign(models.Model):
    height = models.CharField(max_length=5)
    weight = models.CharField(max_length=5)
    temperature = models.CharField(max_length=4)
    hand_img = models.FileField(upload_to='hand_img/')
    mouth_img = models.FileField(upload_to='mouth_img/')
    student = models.ManyToManyField(to='Student')
    create_time = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return str(self.create_time)


class Account(models.Model):
    account = models.CharField(max_length=10,null=False)
    password = models.CharField(max_length=10, null=False)
    create_time = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return str(self.account)

class Role(models.Model):
    name = models.CharField(max_length=20)
    create_time = models.DateTimeField(auto_now_add=True)
    permission = models.ManyToManyField(to='Permission')
    def __str__(self):
        return self.name

class Permission(models.Model):
    name = models.CharField(max_length=20)
    create_time = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name