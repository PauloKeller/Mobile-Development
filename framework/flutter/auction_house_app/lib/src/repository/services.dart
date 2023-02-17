import 'package:auction_house_app/src/models/models.dart';

abstract class Services {
  Future<List<Auction>> fetchAuctions();
}