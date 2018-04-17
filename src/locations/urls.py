from django.urls import path
from django.conf.urls import url
from . import views

app_name='locations'

urlpatterns = [
    path('list/', views.LocationList.as_view(), name='location_list'),
]
