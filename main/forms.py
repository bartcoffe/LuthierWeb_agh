from django import forms
from django.forms import ModelForm, ModelChoiceField,Select
from .models import *

class UserListingForm(ModelForm):

    class Meta:
        model = Userlisting
        fields = ['proposedprice','guitarbrandid','sellerdescription','categoryid','guitarbrandid','yearguitarproduced','noowners']


class UserListingPhotoForm(forms.Form):
    img=forms.ImageField()
