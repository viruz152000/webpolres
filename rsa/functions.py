from django.contrib.auth import get_user_model

from rsa.models import LevelModel, PostModel, EncryptModel, DecryptModel

import os

def CreateNewPolice(level, nip, name, jabatan, pangkat, tempat, alamat, photo):
	levelus = LevelModel.objects.get(id=level)
	postus = PostModel.objects.get(id=tempat)

	user = None

	if level == '2' or level == '3':
		user = get_user_model().objects.create_user(
			level=levelus,
			nip=nip,
			username=makeusername(name,nip),
			password=makeusername(name,nip),
			first_name=makefirstname(name),
			last_name=makelastname(name),
			jabatan=jabatan,
			pangkat=pangkat,
			post=postus,
			alamat=alamat,
			foto=photo
			)
	elif level == '1':	
		user = get_user_model().objects.create_superuser(
			level=levelus,
			nip=nip,
			password=makeusername(name,nip),
			first_name=makefirstname(name),
			last_name=makelastname(name),
			jabatan=jabatan,
			pangkat=pangkat,
			post=postus,
			alamat=alamat,
			foto=photo
			)
	return user

def EditPolice(username, level, nip, name, jabatan, pangkat, tempat, alamat, photo):
	levelus = LevelModel.objects.get(id=level)
	postus = PostModel.objects.get(id=tempat)

	user = get_user_model().objects.get(username=username)

	user.level=levelus
	user.nip=nip
	user.first_name=makefirstname(name)
	user.last_name=makelastname(name)
	user.jabatan=jabatan
	user.pangkat=pangkat
	user.post=postus
	user.alamat=alamat
	if photo is not None or photo != '':
		user.foto=photo
	user.save()
	return user

def splitname(name):
	return name.split()

def makeusername(name, nip):
	return f'{splitname(name.lower())[0]}{nip}'

def makefirstname(name):
	return splitname(name)[0]
	
def makelastname(name):
	if len(splitname(name)) > 1:
		return ' '.join(splitname(name)[1:])
	else:
		return ''


def getonlyfilename(file_path):
    filename, extension = os.path.splitext(file_path)
    return filename

def getnormalizedsize(size):
	mb = int(size) / (1024 * 1024)
	return f'{round(mb, 2)} MB'