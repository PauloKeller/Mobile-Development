import 'package:super_hero/src/models/appearance/appearance_model.dart';
import 'package:super_hero/src/models/models.dart';

class HeroModel {
  final int id;
  final String name;
  final String slug;
  final PowerStatsModel powerStats;
  final AppearanceModel appearance;
  final ImageModel images;
  final BiographyModel biography;

  HeroModel(this.id, this.name, this.slug, this.powerStats, this.appearance, this.images, this.biography);

  HeroModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        slug = map['slug'],
        powerStats = PowerStatsModel.fromMap(map['powerstats']),
        appearance = AppearanceModel.fromMap(map["appearance"]),
        images = ImageModel.fromMap(map["images"]),
        biography = BiographyModel.fromMap(map["biography"]);
}
