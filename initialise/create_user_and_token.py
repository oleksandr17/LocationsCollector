from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token

User.objects.all().delete()
Token.objects.all().delete()

user = User.objects.create_user(username='default', password=User.objects.make_random_password())
Token.objects.create(user=user)
