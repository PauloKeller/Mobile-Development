// @dart=2.9
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:super_hero/src/dto/all_heroes_response_dto.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/providers/hero/heroes_provider.dart';

class HeroesProviderMock extends Mock implements HeroesProvider {}

void main() {
  final provider = HeroesProviderMock();

  setUp(() {});

  group('Test heroes provider', () {
    test('Test get all heroes should success', () async {
      final heroesMock = HeroModel(
        1,
        "test-1",
        "slug-1",
        PowerStatsModel(
          intelligence: 10,
          strength: 10,
          speed: 10,
          durability: 10,
          power: 10,
          combat: 10,
        ),
        AppearanceModel(Gender.male, "Human", "Brown", "Grey"),
        ImageModel(xs: "", sm: "", md: "", lg: ""),
        BiographyModel(
          fullName: "",
          alterEgos: "alterEgos",
          placeOfBirth: "placeOfBirth",
          firstAppearance: "firstAppearance",
          publisher: "publisher",
          alignment: "alignment",
        ),
      );
      final mock = AllHeroesResponseDTO([heroesMock]);

      when(provider.getAllHeroes()).thenAnswer((_) async => mock);

      final response = await provider.getAllHeroes();

      expect(response.results.length, 1);

      final heroResponse = response.results[0];

      expect(heroResponse.name, equals("test-1"));
      expect(heroResponse.id, equals(1));
      expect(heroResponse.powerStats.speed, equals(10));
      expect(heroResponse.biography.alignment, equals("alignment"));
    });
  });
}
