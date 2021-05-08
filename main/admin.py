from django.contrib import admin
from .models import *
# Register your models here.



class LuthierServiceAdmin(admin.ModelAdmin):
   fields=['orderdeadline','orderdate','guitarbrandid','guitarcategoryid','servicecost','luthierid','orderstatusid','luthierproblemdesc']

#     fieldsets= [
#         ('order date/deadline',{'fields':['orderdate','orderdeadline']})
#     ]







admin.site.register(Categories)
admin.site.register(City)
admin.site.register(Guitarbrand)
admin.site.register(Listingstatushistory)
admin.site.register(Luthierinteractionshist)
admin.site.register(Luthierservice,LuthierServiceAdmin)
admin.site.register(Productstatusresponses)
admin.site.register(Userlisting)
admin.site.register(Userrole)
admin.site.register(Users)
admin.site.register(Listingpictureurl)
