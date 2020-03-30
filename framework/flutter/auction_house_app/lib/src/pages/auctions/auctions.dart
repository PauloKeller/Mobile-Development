import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:auction_house_app/src/widgets/widgets.dart';
import 'package:auction_house_app/src/providers/providers.dart';

class AuctionsPage extends StatefulWidget {
  @override
  _AuctionsPageState createState() => _AuctionsPageState();
}

class _AuctionsPageState extends State<AuctionsPage> {
  final _moneyFormatter = NumberFormat("#,##0.00", "pt_BR");

  void _navigateToAuctionDetails() {}

  Widget _buildAuctionsList() {
    return Consumer<AuctionBloc>(
      builder: (context, auction, child) {

        return ListView.builder(
          itemCount: auction.auctions.length,
          itemBuilder: (context, index) {
            return AuctionWidget(
              title: _moneyFormatter.format(auction.auctions[index].buyOut),
              subtitle: _moneyFormatter.format(auction.auctions[index].minimumBid),
              onTap: _navigateToAuctionDetails,
            );
          },
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<AuctionBloc>(context, listen: false).fetchAuctions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Auctions",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: _buildAuctionsList(),
        ),
      ),
    );
  }
}
