import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:softplan_challenge/src/models/models.dart';

class OwnerPage extends StatefulWidget {
  final UserModel user;

  const OwnerPage({Key key, @required this.user}) : super(key: key);

  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  Widget _buildGoogleMapsView() {
    final completer = Completer();
    final cameraPosition = CameraPosition(
      target: LatLng(widget.user.address.geo.lat, widget.user.address.geo.lng),
      zoom: 5.0,
    );

    return Expanded(
      child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          completer.complete(controller);
        },
      ),
    );
  }

  Widget _buildTextLabel({@required String label, @required String value}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(label),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final address = "${widget.user.address.street} - ${widget.user.address.suite}, ${widget.user.address.city} / ${widget.user.address.zipcode}";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reponsável",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildTextLabel(label: "Nome:", value: widget.user.name),
              _buildTextLabel(label: "Email:", value: widget.user.email),
              _buildTextLabel(label: "Telefone: ", value: widget.user.phone),
              _buildTextLabel(label: "Endereço: ", value: address),
              _buildGoogleMapsView(),
            ],
          ),
        ),
      ),
    );
  }
}
