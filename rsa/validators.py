from django.contrib.auth import get_user_model

from rsa.keys import Keys
from rsa.generates import GenerateSlug

import os

def AllowedExtensions():
	return ['pdf', 'enc']

def ValidateFile(value):
	valid_extensions = AllowedExtensions()
	if value.lower() in valid_extensions:
		return True

def ValidateNIP(value):
	if get_user_model().objects.filter(nip=value).exists():
		return False
	else:
		return True

def FileStatus(filename):
	file_extension = os.path.splitext(filename)[1][1:]
	if file_extension in AllowedExtensions()[0]:
		return 'encrypt'
	elif file_extension in AllowedExtensions()[-1]:
		return 'decrypt'
	else:
		return file_extension

def ValidateKeyPair(primeP , primeQ):
	keys = Keys()
	msg = ''
	if keys.isPrime(primeP) and keys.isPrime(primeQ):
		if primeP == primeQ:
			msg = 'Key tidak boleh sama!'
		else:
			if primeP < 15 or primeQ < 15 :
				msg = 'Key harus > 15!'
			elif primeP < 2 or primeQ < 2:
				msg = 'Key tidak valid!'
			else:
				msg = 'valid'
	else:
		if not keys.isPrime(primeP) and not keys.isPrime(primeQ):
			msg = 'P dan Q'
		elif not keys.isPrime(primeP):
			msg = 'P'
		elif not keys.isPrime(primeQ):
			msg = 'Q'
		msg += ' bukan prima!'
	return msg

def ValidatePrivateKey(value):
	status, message = None, None
	priv1, priv2 = 0, 0
	try:
		priv1, priv2 = value.split(',')
		try:
			priv1, priv2 = int(priv1), int(priv2)
			status = 'success'
			message = 'ok'
		except Exception as e:
			status = 'danger'
			message = 'Masukkan kunci dengan benar!'
	except Exception as e:
		status = 'danger'
		message = 'Masukkan kunci dengan benar!'
	return status, message, (priv1, priv2)

def ValidatePublicKey(value):
	public1, public2 = 0, 0
	try:
		public1, public2 = value.split(',')
		try:
			public1, public2 = int(public1), int(public2)
		except Exception as e:
			pass
	except Exception as e:
		pass
	return public1, public2

def Slugification(model):
	slug = GenerateSlug()
	while model.objects.filter(slug=slug).exists():
		slug = GenerateSlug()
	return slug
