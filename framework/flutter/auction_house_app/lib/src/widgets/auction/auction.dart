import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AuctionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  AuctionWidget({
    @required this.title,
    @required this.subtitle,
    this.onTap,
  });

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        TextSpan(text: "\tR\$", style: TextStyle(letterSpacing: 1,),),
      ]),
    );
  }

  Widget _buildSubtitle() {
    final text = "$subtitle R\$";
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _buildTitle(),
      onTap: onTap,
      subtitle: _buildSubtitle(),
      leading: Container(
        height: 50.0,
        width: 50.0,
        child: CircleAvatar(
        ),
      ),
      trailing: Icon(
        MdiIcons.shopping,
      ),
    );
  }
}
