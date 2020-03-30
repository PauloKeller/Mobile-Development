library item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:auction_house_app/src/models/models.dart';

part 'item.g.dart';

abstract class Item implements Built<Item, ItemBuilder> {
  Item._();

  factory Item([updates(ItemBuilder b)]) = _$Item;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'description')
  String get description;

  String toJson() {
    return json.encode(serializers.serializeWith(Item.serializer, this));
  }

  static Item fromJson(String jsonString) {
    return serializers.deserializeWith(
        Item.serializer, json.decode(jsonString));
  }

  static Serializer<Item> get serializer => _$itemSerializer;
}