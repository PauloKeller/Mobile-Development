import 'package:flutter/material.dart';
import 'package:super_hero/src/models/biography/biography_model.dart';

class HeroBiographyDetails extends StatelessWidget {
  final BiographyModel _biography;

  const HeroBiographyDetails(this._biography, {Key? key}) : super(key: key);

  Widget _buildListTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildListTile("Full name:", _biography.fullName),
          _buildListTile("Alter egos:", _biography.alterEgos),
          _buildListTile("Place of birth:", _biography.placeOfBirth),
          _buildListTile("First appearance:", _biography.firstAppearance),
          _buildListTile("Publisher:", _biography.publisher),
          _buildListTile("Alignment:", _biography.alignment),
        ],
      ),
    );
  }
}
