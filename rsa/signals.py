from django.apps import apps
from django.db.models.signals import pre_migrate
from django.dispatch import receiver
from rsa.models import LevelModel, PostModel

@receiver(pre_migrate)
def add_default_values(sender, **kwargs):
    """
    Signal handler to add default values to the model before migrations.
    """
    # Check if the signal is sent by the app containing LevelModel
    if sender.name == 'rsa':
        # Check if the LevelModel model exists
        if apps.is_installed('rsa'):
            # Add default values to Models
            LevelModel.objects.get_or_create(level='Administrator')
            LevelModel.objects.get_or_create(level='User')
            LevelModel.objects.get_or_create(level='Pimpinan')
            PostModel.objects.get_or_create(post='Polres Kota Magelang')
            PostModel.objects.get_or_create(post='Polsek Magelang Tengah')
            PostModel.objects.get_or_create(post='Polsek Magelang Utara')
            PostModel.objects.get_or_create(post='Polsek Magelang Selatan')
            PostModel.objects.get_or_create(post='Polsek Magelang Mortoyudan')
            # pass