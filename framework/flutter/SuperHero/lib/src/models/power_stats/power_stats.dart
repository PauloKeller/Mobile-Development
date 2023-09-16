class PowerStatsModel {
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  PowerStatsModel({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  PowerStatsModel.fromMap(Map<String, dynamic> map) :
        intelligence = map['intelligence'],
        strength = map['strength'],
        speed = map['speed'],
        durability = map['durability'],
        power = map['power'],
        combat = map['combat'];
}
