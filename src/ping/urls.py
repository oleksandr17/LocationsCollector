from django.urls import path
from . import views

app_name='ping'

urlpatterns = [
    path('', views.Ping.as_view(), name='ping'),
]
