from django.urls import path

from . import views

app_name='locations'

urlpatterns = [
    path('list/', views.LocationListView.as_view(), name='location_list'),
    path('map/', views.LocationsMapView.as_view(), name='location_map'),
]
