from django.contrib import admin
from rsa.models import LevelModel, CustomUser, PostModel, EncryptModel, DecryptModel

# Register your models here.
admin.site.register(LevelModel)
admin.site.register(PostModel)
admin.site.register(EncryptModel)
admin.site.register(DecryptModel)
admin.site.register(CustomUser)