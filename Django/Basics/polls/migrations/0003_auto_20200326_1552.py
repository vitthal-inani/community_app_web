# Generated by Django 2.2.1 on 2020-03-26 10:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0002_client_guide'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Question',
            new_name='Posts',
        ),
    ]