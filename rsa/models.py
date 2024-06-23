from django.contrib.auth.models import AbstractUser
from django.db import models
from django.contrib.auth import get_user_model

from rsa.managers import CustomUserManager

# Create your models here.
class LevelModel(models.Model):
	level = models.CharField(max_length=15)

	def __str__(self):
		return self.level

class PostModel(models.Model):
	post = models.CharField(max_length=50)
	description = models.CharField(max_length=50)

	def __str__(self):
		return self.post

class CustomUser(AbstractUser):
	db_table = 'auth_user'
	nip = models.CharField(max_length=20, unique=True)
	alamat = models.CharField(max_length=100, null=True)
	level = models.ForeignKey(LevelModel, on_delete=models.CASCADE, default=1)
	pangkat = models.CharField(max_length=50, null=True)
	jabatan = models.CharField(max_length=50, null=True)
	post = models.ForeignKey(PostModel, on_delete=models.CASCADE, default=1)
	foto = models.FileField(upload_to='foto', blank=True, null=True)
	
	USERNAME_FIELD = 'nip'
	EMAIL_FIELD = 'email'
	objects = CustomUserManager()

	def __str__(self):
		return self.nip

	def fullname(self):
		return f'{self.first_name} {self.last_name}'

class EncryptModel(models.Model):
	filename = models.CharField(max_length=256, null=True)
	file = models.FileField(upload_to='uploads/', blank=False, null=False)
	result = models.FileField(upload_to='encrypt/', blank=True, null=True)
	size = models.CharField(max_length=256, null=True)
	created = models.DateTimeField(auto_now_add=True)
	slug = models.SlugField(null=True, unique=True)
	user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)

	def __str__(self):
		return self.slug

	def resultname(self):
		filename = self.result.name.split('/')[-1]
		return filename

class DecryptModel(models.Model):
	filename = models.CharField(max_length=256, null=True)
	file = models.FileField(upload_to='uploads/', blank=False, null=False)
	result = models.FileField(upload_to='decrypt/', blank=True, null=True)
	size = models.CharField(max_length=256, null=True)
	created = models.DateTimeField(auto_now_add=True)
	slug = models.SlugField(null=True, unique=True)
	user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)

	def __str__(self):
		return self.slug

	def resultname(self):
		filename = self.result.name.split('/')[-1]
		return filename