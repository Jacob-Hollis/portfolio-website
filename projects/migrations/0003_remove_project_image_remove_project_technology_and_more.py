# Generated by Django 4.2 on 2023-04-28 14:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projects', '0002_project_description'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='project',
            name='image',
        ),
        migrations.RemoveField(
            model_name='project',
            name='technology',
        ),
        migrations.AddField(
            model_name='project',
            name='githublink',
            field=models.CharField(default='', max_length=255),
        ),
        migrations.AddField(
            model_name='project',
            name='link',
            field=models.CharField(default='', max_length=255),
        ),
        migrations.AddField(
            model_name='project',
            name='technologyone',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='project',
            name='technologythree',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='project',
            name='technologytwo',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='project',
            name='title',
            field=models.CharField(default='', max_length=100),
        ),
    ]