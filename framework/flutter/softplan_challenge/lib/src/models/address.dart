class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final AddressGeo geo;

  AddressModel.fromMap(Map<String, dynamic> map)
      : street = map['street'],
        suite = map['suite'],
        city = map['city'],
        zipcode = map['zipcode'],
        geo = AddressGeo.fromMap(map['geo']);
}

class AddressGeo {
  final double lat;
  final double lng;

  AddressGeo.fromMap(Map<String, dynamic> map)
      : lat = double.parse(map['lat']),
        lng = double.parse(map['lng']);
}
