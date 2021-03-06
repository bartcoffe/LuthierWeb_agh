# Generated by Django 3.0 on 2021-05-07 23:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Categories',
            fields=[
                ('categoryid', models.AutoField(db_column='CategoryID', primary_key=True, serialize=False)),
                ('categoryname', models.CharField(db_column='CategoryName', max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Categories',
                'db_table': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='Userlisting',
            fields=[
                ('listingid', models.AutoField(db_column='ListingID', primary_key=True, serialize=False)),
                ('proposedprice', models.DecimalField(db_column='ProposedPrice', decimal_places=4, max_digits=19)),
                ('sellerdescription', models.TextField(db_column='SellerDescription')),
                ('listingdate', models.DateField(db_column='ListingDate')),
                ('luthierdescription', models.TextField(blank=True, db_column='LuthierDescription', null=True)),
                ('yearguitarproduced', models.IntegerField(blank=True, db_column='YearGuitarProduced', null=True)),
                ('noowners', models.IntegerField(blank=True, db_column='NOowners', null=True)),
                ('buyerid', models.ForeignKey(blank=True, db_column='BuyerID', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='ULbuyerid', to='main.Users')),
                ('categoryid', models.ForeignKey(db_column='CategoryID', on_delete=django.db.models.deletion.DO_NOTHING, to='main.Categories')),
                ('guitarbrandid', models.ForeignKey(db_column='GuitarBrandID', on_delete=django.db.models.deletion.DO_NOTHING, to='main.Guitarbrand')),
                ('luthierid', models.ForeignKey(blank=True, db_column='LuthierID', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='ULluthierid', to='main.Users')),
                ('productstatusid', models.ForeignKey(db_column='ProductStatusID', default=0, on_delete=django.db.models.deletion.DO_NOTHING, to='main.Productstatusresponses')),
                ('sellerid', models.ForeignKey(blank=True, db_column='SellerID', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='main.Users')),
            ],
            options={
                'verbose_name_plural': 'User Listing',
                'db_table': 'UserListing',
            },
        ),
    ]
