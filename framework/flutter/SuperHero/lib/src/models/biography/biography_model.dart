class BiographyModel {
  final String fullName;
  final String alterEgos;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  BiographyModel({
    required this.fullName,
    required this.alterEgos,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  BiographyModel.fromMap(Map<String, dynamic> map) :
        fullName = map['fullName'] ?? "",
        alterEgos = map['alterEgos'] ?? "",
        placeOfBirth = map['placeOfBirth'] ?? "",
        firstAppearance = map['firstAppearance'] ?? "",
        publisher = map['publisher'] ?? "",
        alignment = map['alignment'] ?? "";
}
