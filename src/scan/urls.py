from django.urls import path
from . import views

app_name='scan'

urlpatterns = [
    path('', views.Scan.as_view(), name='scan'),
]
