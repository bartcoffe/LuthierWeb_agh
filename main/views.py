from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Userlisting, Listingpictureurl
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from .forms import * 
from django.core.files.storage import FileSystemStorage
from django.db import connection

# Create your views here.
def test(request):
     x = 'BLANK'
     return render(request = request,
                    template_name='main/home.html',
                    context = {'x':x})


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

     accepted_listings=Userlisting.objects.filter(productstatusid=1)
     return render(request = request,
                 template_name='main/listings.html',
                 context = {"listings":accepted_listings,
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
          # form_pic=UserListingPhotoForm()
          form_pic='xd'
          return render( request = request,
                         template_name=self.template_name,
                         context = {'form':form,
                                   'form_pic':form_pic})


     #template 'test' is just for testing if post request went through
     def post(self,request):
          form = UserListingForm(request.POST)
          # form_pic=UserListingPhotoForm(request.POST, request.FILES)
          if form.is_valid():
               saved_form = form.save()
               proposedprice = form.cleaned_data['proposedprice']
               guitarbrandid = form.cleaned_data['guitarbrandid']
               sellerdescription = form.cleaned_data['sellerdescription']
               categoryid = form.cleaned_data['categoryid']
               guitarbrandid = form.cleaned_data['guitarbrandid']
               yearguitarproduced = form.cleaned_data['yearguitarproduced']
               noowners = form.cleaned_data['noowners']

          # saved_form.refresh_from_db()
          #handling uploaded imgs
          img = request.FILES['img']
          stored_img= FileSystemStorage(location='media/main')
          name = stored_img.save(img.name, img)
          url = stored_img.url(name)
          form_pk = saved_form.pk #get the listing_id so img matches descriptions
          new_photo_row = Listingpictureurl(listingid=Userlisting.objects.latest('listingid'), pictureurl=str(name))
          new_photo_row.save()

          context= {
               'proposedprice':proposedprice,
               'guitarbrandid':guitarbrandid,
               'sellerdescription':sellerdescription,
               'categoryid':categoryid,
               'guitarbrandid':guitarbrandid,
               'yearguitarproduced':yearguitarproduced,
               'noowners':noowners,
               'url':url
          }
          return render( request = request,
                         template_name='main/test.html',
                         context = context)


def sold(request,listing_id):
     user_id=1
     listing_id=int(listing_id)
     sold=4
     cursor = connection.cursor()
     try:
          cursor.execute('EXEC [dbo].[spChangeListingProductStatus] {}, {}, {}'.format(user_id,listing_id, sold))
     finally:
          cursor.close()


     return render(request = request,
                    template_name='main/sold.html',
                    context = {'x':listing_id})