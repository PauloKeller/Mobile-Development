import 'package:flutter/material.dart';

class PowerStatsBar extends StatelessWidget {
  final String _name;
  final double _progress;
  final Color _color;

  const PowerStatsBar([this._name = "default", this._progress = 0.20, this._color = Colors.blueAccent]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          LinearProgressIndicator(
            value: _progress,
            color: _color,
            backgroundColor: Colors.grey,
          )
        ],
      ),
    );
  }
}
