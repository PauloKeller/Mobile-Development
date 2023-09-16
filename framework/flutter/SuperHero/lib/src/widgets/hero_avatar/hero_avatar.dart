import 'package:flutter/material.dart';

class HeroAvatar extends StatelessWidget {
  final String _imageUrl;
  final VoidCallback _onTap;
  final double _height;

  const HeroAvatar(this._imageUrl, this._height, this._onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Hero(
        tag: _imageUrl,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _onTap,
            child: Image.network(
              _imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
