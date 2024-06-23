from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns=[
    path('', views.beranda, name='beranda'),
    path('profil/', views.profil, name='profil'),
    path('tentang/', views.tentang, name='tentang'),
    path('daftar-file/', views.files, name='daftar-file'),
    path('daftar-polisi/', views.polices, name='daftar-polisi'),
    path('tambah-polisi/', views.createpolices, name='tambah-polisi'),
    path('edit-polisi/<str:username>', views.editpolices, name='edit-polisi'),
    path('validate-file/', views.filevalidate, name='validate-file'),
    path('validate-key/', views.keyvalidate, name='validate-key'),
    path('validate-private/', views.privatevalidate, name='validate-private'),
    path('delete-polisi/<str:nip>/', views.deletepolice, name='delete-polisi'),
    path('delete-file/<str:status>/<slug:slug>/', views.deletefile, name='delete-file'),
    path('download-file/<str:status>/<slug:slug>/', views.downloadfile, name='download-file'),
    path('login/', views.signin, name='login'),
    path('logout/', views.signout, name='logout'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)