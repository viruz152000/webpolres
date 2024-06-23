from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.conf import settings
from django.http import HttpResponse, JsonResponse
from django.contrib import messages
from django.contrib.auth import get_user_model
from django.contrib.auth.models import auth
from django.core.files.storage import default_storage
from django.core.files import File

from rsa.functions import *
from rsa.keys import Keys
from rsa.validators import *
from rsa.models import EncryptModel, DecryptModel
from rsa.generates import GenerateSlug
from rsa.rsa import RSACrypto

import tempfile, pickle
from reportlab.pdfgen import canvas


# Create your views here.
def signin(request):
	if request.method == 'POST':
		nip = request.POST['nip']
		password = request.POST['password']
		user = auth.authenticate(nip=nip, password=password)
		if user is not None:
			auth.login(request, user)
			return redirect('beranda')
		else:
			messages.error(request, 'Login gagal')
			return redirect('login')
	context = {
		'title': 'login',
	}
	return render(request, "login.html", context)

def signout(request):
	if not request.user.is_authenticated:
		return redirect('login')
	auth.logout(request)
	return redirect('login')

def beranda(request):
	if not request.user.is_authenticated:
		return redirect('login')
	complete = False
	status, slug = None, None
	# user = get_user_model().objects.get(nip='2024')
	if request.method == 'POST':
		rsa = RSACrypto()
		if 'file' in request.FILES:
			file = request.FILES['file']
			if 'encrypt' in FileStatus(file.name):
				publicEnc = request.POST['publicKeyEnc']

				public = ValidatePublicKey(publicEnc)

				slug = Slugification(EncryptModel)

				instance = EncryptModel.objects.create(
					filename = file.name,
					file = file,
					slug = slug,
					user = request.user,
					)

				contents = instance.file.read()
				filename = getonlyfilename(file.name)
				decodedcontent = contents.decode('latin-1')
				enc = rsa.encrypt(decodedcontent, public)
				instance.size = instance.file.size
				instance.save()

				with tempfile.NamedTemporaryFile(delete=False) as file:
					pickle.dump(enc, file)
					instance.result.save(f'{filename}.enc', File(file))

				complete = True
				status = 'encrypt'


			if 'decrypt' in FileStatus(file.name):
				privateDec = request.POST['privateKeyDec']
				_, _, keys = ValidatePrivateKey(privateDec)

				slug = Slugification(DecryptModel)

				instance = DecryptModel.objects.create(
					filename = file.name,
					file = file,
					slug = slug,
					user = request.user,
					)

				filename = getonlyfilename(file.name)
				instance.size = instance.file.size
				instance.save()

				with open(instance.file.path, 'rb') as file:
					data = pickle.load(file)

				dec = rsa.decrypt(data, keys)

				try:
					with tempfile.NamedTemporaryFile(delete=False) as file:
						file.write(dec.encode('latin-1'))
						instance.result.save(f'{filename}-dec.pdf', File(file))
				except Exception as e:
					with tempfile.NamedTemporaryFile(delete=False) as file:
						c = canvas.Canvas(file.name)
						c.save()
						instance.result.save(f'{filename}-dec.pdf', File(file))


				complete = True
				status = 'decrypt'
	context = {
		'title': 'beranda',
		'complete': complete,
		'status': status,
		'slug': slug,
	}
	return render(request, "beranda.html", context)

def profil(request):
	if not request.user.is_authenticated:
		return redirect('login')
	user = request.user
	context = {
		'title': 'profil',
		'user': user,
	}
	return render(request, "profile.html", context)

def files(request):
	if not request.user.is_authenticated:
		return redirect('login')
	files = None
	level = request.user.level_id
	# print(type(files))
	if level == 1:
		filesEn = EncryptModel.objects.all()
		for index, file in enumerate(filesEn):
			file.jenis = 'Enkripsi'
			file.status = 'encrypt'
			file.size = getnormalizedsize(file.size)
		filesDe = DecryptModel.objects.all()
		for index, file in enumerate(filesDe):
			file.jenis = 'Dekripsi'
			file.status = 'decrypt'
			file.size = getnormalizedsize(file.size)
		files = list(filesEn) + list(filesDe)
	elif level == 2:
		files = EncryptModel.objects.filter(user=request.user)
		for index, file in enumerate(files):
			file.jenis = 'Enkripsi'
			file.status = 'encrypt'
			file.size = getnormalizedsize(file.size)
	elif level == 3:
		files = DecryptModel.objects.filter(user=request.user)
		for index, file in enumerate(files):
			file.jenis = 'Dekripsi'
			file.status = 'decrypt'
			file.size = getnormalizedsize(file.size)
	else:
		pass
	context = {
		'title': 'daftar file',
		'files': files
	}
	return render(request, "daftar-file.html", context)

def polices(request):
	if not request.user.is_authenticated:
		return redirect('login')
	users = get_user_model().objects.all()
	# print(users)
	context = {
		'title': 'data polisi',
		'users': users,
	}
	return render(request, "daftar-polisi.html", context)

def tentang(request):
	if not request.user.is_authenticated:
		return redirect('login')
	context = {
		'title': 'tentang',
	}
	return render(request, "tentang.html", context)

def createpolices(request):
	if not request.user.is_authenticated:
		return redirect('login')
	if request.method == 'POST':
		level = request.POST['level_users']
		nip = request.POST['nip']
		name = request.POST['name']
		jabatan = request.POST['jabatan']
		pangkat = request.POST['pangkat']
		tempat = request.POST['tempat_tugas']
		alamat = request.POST['alamat']
		photo = request.FILES['photo']
		if ValidateNIP(nip):
			# print(level)
			user = CreateNewPolice(level, nip, name, jabatan, pangkat, tempat, alamat, photo)
			if user is not None:
				messages.success(request, f'{name} berhasil ditambahkan')
			else:
				messages.error(request, f'{name} gagal ditambahkan')

		else:
			messages.error(request, 'NIP telah terdaftar!')
	context = {
		'title': 'tambah polisi',
	}
	return render(request, "create-polisi.html", context)

def editpolices(request, username):
	if not request.user.is_authenticated:
		return redirect('login')

	user = get_user_model().objects.get(username=username)

	if request.method == 'POST':
		level = request.POST['level_users']
		nip = request.POST['nip']
		name = request.POST['name']
		jabatan = request.POST['jabatan']
		pangkat = request.POST['pangkat']
		tempat = request.POST['tempat_tugas']
		alamat = request.POST['alamat']
		photo = request.FILES['photo'] if 'photo' in request.FILES else None

		user = EditPolice(username, level, nip, name, jabatan, pangkat, tempat, alamat, photo)
		if user is not None:
			messages.success(request, f'{name} berhasil diubah')
		else:
			messages.error(request, f'{name} gagal diubah')

	context = {
		'title': f'edit polisi - {user.fullname()}',
		'user': user,
	}
	return render(request, "edit-polisi.html", context)

def filevalidate(request):
	if not request.user.is_authenticated:
		return redirect('login')
	userlevel = request.user.level_id
	status, message, ext = None, None, None
	if request.method == 'POST':
		file = request.POST['fileExt']
		if ValidateFile(file):
			ext = file
			if userlevel == 2 and ext == 'enc':
				status = 'danger'
				message = 'Hanya file PDF'
			elif userlevel == 3 and ext == 'pdf':
				status = 'danger'
				message = 'Hanya file ENC'
			else:
				status = 'success'
				message = 'ok'
		else:
			status = 'danger'
			message = 'Hanya file '
			if userlevel == 1:
				message += 'PDF/ENC!'
			elif userlevel == 2:
				message += 'PDF!'
			elif userlevel == 3:
				message += 'ENC!'

	data = {
		'status': status,
		'message': message,
		'ext': ext,
	}
	return JsonResponse(data)

def keyvalidate(request):
	if not request.user.is_authenticated:
		return redirect('login')
	keys = Keys()
	message = None
	status, message = '', ''
	public, private = '', ''
	if request.method == 'POST':
		primeNumberP = request.POST['inputP']
		primeNumberQ = request.POST['inputQ']
		try:
			status = 'success'
			primeP = int(primeNumberP)
			primeQ = int(primeNumberQ)
			result = ValidateKeyPair(primeP, primeQ)
			if result == 'valid':
				public, private = keys.determinedKey(primeP, primeQ)

				while public == private:
					public, private = keys.determinedKey(primeP, primeQ)

				public = ','.join(str(x) for x in public)
				private = ','.join(str(x) for x in private)
				status = 'success'
				message = 'Berhasil membuat kunci'
			else:
				message = result
				status = 'danger'
		except Exception as e:
			status = 'danger'
			message = 'Terjadi kesalahan'

	data = {
		'status': status,
		'message': message,
		'public': public,
		'private': private,
	}
	return JsonResponse(data)

def privatevalidate(request):
	if not request.user.is_authenticated:
		return redirect('login')
	status, message = None, None
	if request.method == 'POST':
		private = request.POST['private']
		status, message, _ = ValidatePrivateKey(private)
	data = {
		'status': status,
		'message': message,
	}
	return JsonResponse(data)

def deletepolice(request, nip):
	if not request.user.is_authenticated:
		return redirect('login')
	try:
		user = get_object_or_404(get_user_model(), nip=nip)
		user.delete()
		messages.success(request, f'{user.fullname()} berhasil dihapus')
		return redirect('daftar-polisi')
	except Exception as e:
		messages.error(request, f'{user.fullname()} tidak ditemukan')
		return redirect('daftar-polisi')

def downloadfile(request, status, slug):
	file = None
	if status == 'encrypt':
		file = get_object_or_404(EncryptModel, slug=slug)
	elif status == 'decrypt':
		file = get_object_or_404(DecryptModel, slug=slug)
	else:
		return redirect('daftar-file')
	response = HttpResponse(file.result, content_type='application/force-download')
	response['Content-Disposition'] = f'attachment; filename="{file.resultname()}"'
	return response

def deletefile(request, status, slug):
	if not request.user.is_authenticated:
		return redirect('login')
	if status == 'encrypt':
		try:
			get_object_or_404(EncryptModel, slug=slug).delete()
			messages.success(request, 'File berhasil dihapus')
			return redirect('daftar-file')
		except Exception as e:
			messages.error(request, 'File tidak ditemukan')
			return redirect('daftar-file')
	elif status == 'decrypt':
		try:
			get_object_or_404(DecryptModel, slug=slug).delete()
			messages.success(request, 'File berhasil dihapus')
			return redirect('daftar-file')
		except Exception as e:
			messages.error(request, 'File tidak ditemukan')
			return redirect('daftar-file')
	else:
		return redirect('daftar-file')