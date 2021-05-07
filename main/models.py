# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Categories(models.Model):
    categoryid = models.AutoField(db_column='CategoryID', primary_key=True)  # Field name made lowercase.
    categoryname = models.CharField(db_column='CategoryName', max_length=50)  # Field name made lowercase.
   
    def __str__(self):
        return self.categoryname
 
    class Meta:
        
        db_table = 'Categories'
        verbose_name_plural ='Categories'


class City(models.Model):
    cityid = models.AutoField(db_column='CityID', primary_key=True)  # Field name made lowercase.
    postalcode = models.CharField(db_column='postalCode', max_length=50)  # Field name made lowercase.
    placename = models.CharField(db_column='PlaceName', max_length=50)  # Field name made lowercase.
    state = models.CharField(db_column='State', max_length=50)  # Field name made lowercase.
    stateabbr = models.CharField(db_column='StateAbbr', max_length=50)  # Field name made lowercase.
    lat_wgs84 = models.DecimalField(db_column='LAT_wgs84', max_digits=9, decimal_places=6)  # Field name made lowercase.
    lon_wgs84 = models.DecimalField(db_column='LON_wgs84', max_digits=9, decimal_places=6)  # Field name made lowercase.

    def __str__(self):
        return self.placename

    class Meta:
        managed = False
        db_table = 'City'
        verbose_name_plural ='City'


class Guitarbrand(models.Model):
    brandid = models.AutoField(db_column='BrandID', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=50)  # Field name made lowercase.
   
    def __str__(self):
        return self.name
  
    class Meta:
        managed = False
        db_table = 'GuitarBrand'
        verbose_name_plural ='Guitar Brand'

class Listingstatushistory(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    listingid = models.ForeignKey('Userlisting', models.DO_NOTHING, db_column='listingID', blank=True, null=True)  # Field name made lowercase.
    date = models.DateTimeField()
    responseidchangedfrom = models.ForeignKey('Productstatusresponses', models.DO_NOTHING, db_column='ResponseIDchangedFrom', blank=True, null=True)  # Field name made lowercase.
    responseidchangedto = models.IntegerField(db_column='ResponseIDchangedTo', blank=True, null=True)  # Field name made lowercase.
    pricechangedfrom = models.DecimalField(db_column='PriceChangedFrom', max_digits=19, decimal_places=4, blank=True, null=True)  # Field name made lowercase.
    pricechangedto = models.DecimalField(db_column='PriceChangedTo', max_digits=19, decimal_places=4, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return str(self.listingid)


    class Meta:
        managed = False
        db_table = 'ListingStatusHistory'
        verbose_name_plural ='Listing Status History'

class Luthierinteractionshist(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    orderid = models.ForeignKey('Luthierservice', models.DO_NOTHING, db_column='OrderID', blank=True, null=True)  # Field name made lowercase.
    interactiondate = models.DateTimeField(db_column='InteractionDate')  # Field name made lowercase.
    responseidchangedfrom = models.ForeignKey('Productstatusresponses', models.DO_NOTHING, db_column='ResponseIDchangedFrom', blank=True, null=True)  # Field name made lowercase.
    responseidchangedto = models.IntegerField(db_column='ResponseIDchangedTo', blank=True, null=True)  # Field name made lowercase.
    pricechangedfrom = models.DecimalField(db_column='PriceChangedFrom', max_digits=19, decimal_places=4, blank=True, null=True)  # Field name made lowercase.
    pricechangedto = models.DecimalField(db_column='PriceChangedTo', max_digits=19, decimal_places=4, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return str(self.orderid)


    class Meta:
        managed = False
        db_table = 'LuthierInteractionsHist'
        verbose_name_plural ='Luthier Interactions History'

class Luthierservice(models.Model):
    orderid = models.AutoField(db_column='OrderID', primary_key=True)  # Field name made lowercase.
    orderdate = models.DateField(db_column='OrderDate')  # Field name made lowercase.
    orderstatusid = models.ForeignKey('Productstatusresponses', models.DO_NOTHING, db_column='OrderStatusID')   # Field name made lowercase.
    orderdeadline = models.DateField(db_column='OrderDeadline')  # Field name made lowercase.
    guitarbrandid = models.ForeignKey(Guitarbrand, models.DO_NOTHING, db_column='GuitarBrandID')  # Field name made lowercase.
    guitarcategoryid = models.ForeignKey(Categories, models.DO_NOTHING, db_column='GuitarCategoryID')  # Field name made lowercase.
    servicecost = models.DecimalField(db_column='ServiceCost', max_digits=19, decimal_places=4, blank=True, null=True)  # Field name made lowercase.
    luthierid = models.ForeignKey('Users', models.DO_NOTHING,related_name='LSluthierid', db_column='LuthierID', blank=True, null=True)  # Field name made lowercase.
    customerid = models.ForeignKey('Users', models.DO_NOTHING,related_name='LScustomerid', db_column='CustomerID', blank=True, null=True)  # Field name made lowercase.
    luthierproblemdesc = models.TextField(db_column='LuthierProblemDesc', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    def __str__(self):
        ret = 'order id: ' + str(self.orderid) + ' date : ' + str(self.orderdate)
        return ret


    class Meta:
        managed = False
        db_table = 'LuthierService'
        verbose_name_plural ='Luthier Service'

class Productstatusresponses(models.Model):
    statusid = models.IntegerField(db_column='StatusID', primary_key=True)  # Field name made lowercase.
    statusname = models.CharField(db_column='StatusName', max_length=50)  # Field name made lowercase.
  
    def __str__(self):
        return self.statusname

    class Meta:
        managed = False
        db_table = 'ProductStatusResponses'
        verbose_name_plural ='Product Status Responses'

class Userlisting(models.Model):
    listingid = models.AutoField(db_column='ListingID', primary_key=True)  # Field name made lowercase.
    proposedprice = models.DecimalField(db_column='ProposedPrice', max_digits=19, decimal_places=4)  # Field name made lowercase.
    sellerdescription = models.TextField(db_column='SellerDescription')  # Field name made lowercase. This field type is a guess.
    productstatusid = models.ForeignKey(Productstatusresponses, models.DO_NOTHING, db_column='ProductStatusID')  # Field name made lowercase.
    sellerid = models.ForeignKey('Users', models.DO_NOTHING, db_column='SellerID', blank=True, null=True)  # Field name made lowercase.
    categoryid = models.ForeignKey(Categories, models.DO_NOTHING, db_column='CategoryID')  # Field name made lowercase.
    listingdate = models.DateField(db_column='ListingDate')  # Field name made lowercase.
    luthierid = models.ForeignKey('Users', models.DO_NOTHING,related_name='ULluthierid', db_column='LuthierID', blank=True, null=True)  # Field name made lowercase.
    buyerid = models.ForeignKey('Users', models.DO_NOTHING,related_name='ULbuyerid', db_column='BuyerID', blank=True, null=True)  # Field name made lowercase.
    guitarbrandid = models.ForeignKey(Guitarbrand, models.DO_NOTHING, db_column='GuitarBrandID')  # Field name made lowercase.
    luthierdescription = models.TextField(db_column='LuthierDescription', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    yearguitarproduced = models.IntegerField(db_column='YearGuitarProduced', blank=True, null=True)  # Field name made lowercase.
    noowners = models.IntegerField(db_column='NOowners', blank=True, null=True)  # Field name made lowercase.
   
    def __str__(self):
        return str(self.listingid)

    class Meta:
        db_table = 'UserListing'
        verbose_name_plural ='User Listing'

class Listingpictureurl(models.Model):
    listingid = models.ForeignKey('Userlisting', models.DO_NOTHING, db_column='ListingID')  # Field name made lowercase.
    pictureurl = models.CharField(db_column='pictureURL', max_length=150)  # Field name made lowercase.
    
    def __str__(self):
        return 'picture of listing with id:' + str(self.listingid)

    
    class Meta:
        managed = False
        db_table = 'ListingPictureURL'
        verbose_name_plural ='Listing Picture URL'

class Userrole(models.Model):
    roleid = models.IntegerField(db_column='RoleID', primary_key=True)  # Field name made lowercase.
    rolename = models.CharField(db_column='RoleName', max_length=50)  # Field name made lowercase.
   
    def __str__(self):
        return self.rolename

    class Meta:
        managed = False
        db_table = 'UserRole'
        verbose_name_plural ='User Role'

class Users(models.Model):
    userid = models.AutoField(db_column='UserID', primary_key=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='FirstName', max_length=50)  # Field name made lowercase.
    lastname = models.CharField(db_column='LastName', max_length=50)  # Field name made lowercase.
    userroleid = models.ForeignKey(Userrole, models.DO_NOTHING, db_column='UserRoleID')  # Field name made lowercase.
    cityid = models.ForeignKey(City, models.DO_NOTHING, db_column='CityID')  # Field name made lowercase.
    phone = models.CharField(db_column='Phone', max_length=50, blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(max_length=50)
    street_homeno = models.CharField(max_length=150, blank=True, null=True)
    
    def __str__(self):
        username = self.firstname + ' ' + self.lastname
        return username

    class Meta:
        managed = False
        db_table = 'Users'
        verbose_name_plural ='Users'

