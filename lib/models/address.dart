import 'package:found_and_lost_app/models/location/city.dart';
import 'package:found_and_lost_app/models/location/uf.dart';

class Address {

  UF uf;
  City city;

  String zipCode;
  String district;

  Address({this.uf, this.city, this.zipCode, this.district});

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, zipCode: $zipCode, district: $district}';
  }
}