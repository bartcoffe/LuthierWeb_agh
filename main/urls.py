"""guitar_store URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path
from . import views
from .views import AddListing
app_name = 'main'  # here for namespacing of urls.

urlpatterns = [
    path('', views.home,name="home"),
    path('register/', views.register,name="register"),
    path('login/', views.login,name="login"),
    path('listings/', views.listings,name="listings"),
    path('listing_page/<listing_id>', views.listing_page,name="listing_page"),
    #path('add_listing/', views.add_listing,name="add_listing"),
    path('add_listing/', AddListing.as_view()),


    path('test/', views.test,name="xd"),
    path('sold/<listing_id>', views.sold,name="sold"),
    ]

