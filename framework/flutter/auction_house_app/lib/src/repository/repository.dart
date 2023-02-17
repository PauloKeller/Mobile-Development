import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:auction_house_app/src/models/models.dart';

import 'services.dart';

class Repository implements Services {
  final Dio dio;

  Repository(this.dio);

  @override
  Future<List<Auction>> fetchAuctions() async {
    final response = await dio.get("/auctions");
    final List<dynamic> data = jsonDecode(response.data);
    final List<Auction> auctions = [];

    data.forEach((element) {
      final auction = Auction.fromJson(jsonEncode(element));
      auctions.add(auction);
    });

    return auctions;
  }
}
