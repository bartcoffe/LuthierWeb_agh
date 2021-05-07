from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Userlisting, Listingpictureurl
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from .forms import * 


# Create your views here.
def home(request):
     x = 'BLANK'
     return render(request = request,
                    template_name='main/home.html',
                    context = {'x':x})
def register(request):
     form = UserCreationForm
     return render(request = request,
                    template_name='main/register.html',
                    context = {'form':form})

def login(request):
     x = 'blank'
     return render(request = request,
                    template_name='main/login.html',
                    context = {'x':x})

def listings(request):
     pic_dict={}
     for pic in Listingpictureurl.objects.all():
         pic_dict.update({pic.listingid.pk:pic.pictureurl})
     return render(request = request,
                 template_name='main/listings.html',
                 context = {"listings":Userlisting.objects.all(),
                             "listing_pictures":pic_dict
                             })

   
def listing_page(request,listing_id):
     
     #filter returns query set. You have to iterate over its values that are dicts. 
     photo_url= Listingpictureurl.objects.filter(listingid=listing_id).values('pictureurl')
     url=[]
     for x in photo_url:
         # print(x.get('pictureurl'))
          url.append(x.get('pictureurl'))
     
     #if I know query has only one value then I can use get and then .syntax
     description = Userlisting.objects.get(listingid=listing_id).sellerdescription        
     luthier_description = Userlisting.objects.get(listingid=listing_id).luthierdescription  
     year_made = Userlisting.objects.get(listingid=listing_id).yearguitarproduced
     brand = Userlisting.objects.get(listingid=listing_id).guitarbrandid
     category = Userlisting.objects.get(listingid=listing_id).categoryid
     price = Userlisting.objects.get(listingid=listing_id).proposedprice

     context={ 'listing_id':listing_id,
               'url':url[0],
               'description':description,
               'year_made':year_made,
               'brand':brand,
               'category':category,
               'price':price,
               'luthier_description':luthier_description,
               }
     return render(request = request,
                    template_name='main/listing_page.html',
                    context = context)


# def add_listing(request):
#      test = Userlisting.objects.all().values('guitarbrandid_id')
#      form=UserListingForm()
#      form_pic=UserListingPhotoForm()
#      return render(request = request,
#                     template_name='main/add_listing.html',
#                     context = {'form':form,
#                                'form_pic':form_pic})


class AddListing(TemplateView):
     template_name='main/add_listing.html'
     
     def get(self,request):
          form=UserListingForm()
          form_pic=UserListingPhotoForm()
          return render( request = request,
                         template_name=self.template_name,
                         context = {'form':form,
                                   'form_pic':form_pic})
     
     def post(self,request):
          form = UserListingForm(request.POST)
          form_pic=UserListingPhotoForm(request.FILES)
          if (form.is_valid() and form_pic.is_valid()):
               text = form.cleaned_data['sellerdescription']

          return render( request = request,
                         template_name=self.template_name,
                         context = {'form':form,
                                   'form_pic':form_pic})
