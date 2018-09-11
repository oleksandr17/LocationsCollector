import json

from django.urls import reverse
from rest_framework import status

import pytest
from locations import models
from locations.views import LocationListView


@pytest.fixture
def disable_throttling():
    throttle_classes = LocationListView.throttle_classes
    LocationListView.throttle_classes = ()
    try:
        yield
    finally:
        LocationListView.throttle_classes = throttle_classes

@pytest.mark.parametrize('sender_uuid, lat, lng', (
    ('00000000-0000-0000-0000-000000000001', 10.111, 10.999),
    ('00000000-0000-0000-0000-000000000002', 20.111, 20.999),
    ('00000000-0000-0000-0000-000000000003', 30.111, 30.999),
    ('00000000-0000-0000-0000-000000000004', 40.111, 40.999),
))
@pytest.mark.django_db
def test_location_create_success(client, disable_throttling, sender_uuid, lat, lng):
    body = {
        "sender_uuid": sender_uuid,
        "lat": lat,
        "lng": lng
    }
    response = client.post(reverse('locations:location_list'),
                                    content_type='application/json',
                                    data=json.dumps(body))

    assert response.status_code == status.HTTP_201_CREATED

    assert models.Sender.objects.all().count() == 1
    sender = models.Sender.objects.first()
    assert str(sender.uuid) == sender_uuid

    assert models.Location.objects.all().count() == 1
    location = models.Location.objects.first()
    assert location.lat == lat
    assert location.lng == lng
    assert location.sender == sender
    assert location.timestamp != None


@pytest.mark.parametrize('sender_uuid, lat, lng', (
    ('00000000-0000-0000-0000-000000000001', 10.111, None),
    ('00000000-0000-0000-0000-000000000002', None, 20.999),
    (None, 30.111, 30.999),
))
@pytest.mark.django_db
def test_location_create_failure(client, disable_throttling, sender_uuid, lat, lng):
    body = {
        "sender_uuid": sender_uuid,
        "lat": lat,
        "lng": lng
    }
    response = client.post(reverse('locations:location_list'),
                                    content_type='application/json',
                                    data=json.dumps(body))

    assert response.status_code == status.HTTP_400_BAD_REQUEST
    assert models.Sender.objects.all().count() == 0
    assert models.Location.objects.all().count() == 0
