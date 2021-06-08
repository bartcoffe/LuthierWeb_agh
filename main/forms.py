from django import forms
from django.forms import ModelForm, ModelChoiceField,Select
from .models import *

class UserListingForm(ModelForm):

    class Meta:
        model = Userlisting
        fields = ['proposedprice','guitarbrandid','sellerdescription','categoryid','guitarbrandid','yearguitarproduced','noowners']

        labels = {
        'proposedprice': 'Price',
        'guitarbrandid': 'Brand of your guitar',
        'sellerdescription': 'Describe your gear',
        'categoryid': 'Category',
        'guitarbrandid': 'Brand',
        'yearguitarproduced': 'Production year',
        'noowners':'Number of previous owners'
        }


# class UserListingPhotoForm(forms.Form):
#     img=forms.ImageField()
