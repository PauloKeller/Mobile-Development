import 'address.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final AddressModel address;

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        email = map['email'],
        phone = map['phone'],
        address = AddressModel.fromMap(map['address']);
}
