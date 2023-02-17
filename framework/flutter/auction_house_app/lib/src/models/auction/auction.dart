library auction;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:auction_house_app/src/models/models.dart';

part 'auction.g.dart';

abstract class Auction implements Built<Auction, AuctionBuilder> {
  Auction._();

  factory Auction([updates(AuctionBuilder b)]) = _$Auction;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'minimumBid')
  int get minimumBid;

  @BuiltValueField(wireName: 'buyOut')
  int get buyOut;

  @BuiltValueField(wireName: 'owner')
  String get owner;

  @BuiltValueField(wireName: 'item')
  String get item;

  String toJson() {
    return json.encode(serializers.serializeWith(Auction.serializer, this));
  }

  static Auction fromJson(String jsonString) {
    return serializers.deserializeWith(
        Auction.serializer, json.decode(jsonString));
  }

  static Serializer<Auction> get serializer => _$auctionSerializer;
}