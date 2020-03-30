import 'dart:convert';

import 'package:auction_house_app/src/models/auction/auction.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:auction_house_app/src/repository/repository.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  group('UserRemoteDataSource', () {
    final Dio dio = Dio();
    DioAdapterMock dioAdapterMock;
    Repository repository;

    setUp(() {
      dioAdapterMock = DioAdapterMock();
      dio.httpClientAdapter = dioAdapterMock;
      repository = Repository(dio);
    });

    group('Repository services tests', () {
      test('should fetch all Auctions', () async {
        final auctions = [
          {
            "id": "b71ba08f-470d-4a35-8392-5673db8658ae",
            "minimumBid": 10,
            "buyOut": 100,
            "owner": "41b7b612-d862-4a8a-8d35-251767c63bfd",
            "item": "638b3ece-c93b-4db2-b82d-9424ec05a5f8",
          },
          {
            "id": "deeb4296-77a9-4da2-a3a0-e70b2c915d7e",
            "minimumBid": 20,
            "buyOut": 240,
            "owner": "493b4559-d3d6-455e-ade0-9cad9699b624",
            "item": "65ac8468-ef6e-406f-b39f-1c44ceb12acb",
          },
        ];
        final responsePayload = json.encode(auctions);

        final httpResponse = ResponseBody.fromString(responsePayload, 200, headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        });

        when(dioAdapterMock.fetch(any, any, any)).thenAnswer((_) async => httpResponse);

        final subject = await repository.fetchAuctions();
        final expected = [];

        auctions.forEach((a)  {
          expected.add(Auction.fromJson(json.encode(a)));
        });

        expect(subject, expected);
      });
    });
  });
}
