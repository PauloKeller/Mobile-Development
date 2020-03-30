import 'dart:collection';

import 'package:auction_house_app/src/repository/repository.dart';
import 'package:flutter/material.dart';

import 'package:auction_house_app/src/models/models.dart';

class AuctionBloc extends ChangeNotifier {
  final Repository repository;
  final List<Auction> _auctions = [];

  AuctionBloc(this.repository);

  UnmodifiableListView<Auction> get auctions => UnmodifiableListView(_auctions);

  void fetchAuctions() async {
    final auctions = await repository.fetchAuctions();

    _auctions.addAll(auctions);

    notifyListeners();
  }
}
