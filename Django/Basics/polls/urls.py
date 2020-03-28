from django.urls import path
from . import views

urlpatterns = [path('', views.index, name='index'),
               path('<int:admin_id>/', views.detail, name='detail'),
               path('<int:admin_id>/results/', views.results, name='results'),
               path('<int:admin_id>/vote/',views.vote,name='vote'),
               path('<int:admin_id>/json/', views.jsonadmin, name='jsonadmin'),
               ]
