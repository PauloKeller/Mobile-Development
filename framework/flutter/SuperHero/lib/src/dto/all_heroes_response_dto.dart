
import 'package:super_hero/src/models/models.dart';

class AllHeroesResponseDTO {
  final List<HeroModel> results;

  AllHeroesResponseDTO(this.results);

  AllHeroesResponseDTO.fromMap(List<dynamic> maps) :
        results = _fromResultsToList(maps);

  static List<HeroModel> _fromResultsToList(List<dynamic> maps) {
    List<HeroModel> results = maps.map((map) => HeroModel.fromMap(map)).toList();
    return results;
  }
}