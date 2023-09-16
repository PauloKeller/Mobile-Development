import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/widgets/power_stats/power_stats_bar.dart';

class PowerStatsIndicator extends StatelessWidget {
  final PowerStatsModel _power;

  const PowerStatsIndicator(this._power, {Key? key}) : super(key: key);

  double _getPercentage(double power) {
    return power / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Power Stats",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: PowerStatsBar(
              "Intelligence",
              _getPercentage(_power.intelligence.toDouble()),
              Colors.blueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: PowerStatsBar(
              "Strength",
              _getPercentage(_power.strength.toDouble()),
              Colors.redAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: PowerStatsBar(
              "Speed",
              _getPercentage(_power.speed.toDouble()),
              Colors.greenAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: PowerStatsBar(
              "Durability",
              _getPercentage(_power.durability.toDouble()),
              Colors.amberAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: PowerStatsBar(
              "Power",
              _getPercentage(_power.power.toDouble()),
              Colors.lightBlueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: PowerStatsBar(
              "Combat",
              _getPercentage(_power.combat.toDouble()),
              Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
