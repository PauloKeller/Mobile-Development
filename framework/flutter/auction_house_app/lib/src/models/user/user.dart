library user_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:auction_house_app/src/models/models.dart';

part 'user.g.dart';


abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  UserModel._();

  factory UserModel([updates(UserModelBuilder b)]) = _$UserModel;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'fullName')
  String get fullName;
  @BuiltValueField(wireName: 'nickName')
  String get nickName;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'balance')
  double get balance;
  String toJson() {
    return json.encode(serializers.serializeWith(UserModel.serializer, this));
  }

  static UserModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModel.serializer, json.decode(jsonString));
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}