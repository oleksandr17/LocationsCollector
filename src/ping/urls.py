from django.urls import path
from django.conf.urls import url
from . import views

app_name='ping'

urlpatterns = [
    path('', views.Ping.as_view(), name='ping'),
]
