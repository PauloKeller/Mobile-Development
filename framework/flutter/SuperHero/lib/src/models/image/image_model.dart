class ImageModel {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  ImageModel({required this.xs, required this.sm, required this.md, required this.lg});

  ImageModel.fromMap(Map<String, dynamic> map) :
        xs = map['xs'] ?? "",
        sm = map['sm'] ?? "",
        md = map['md'] ?? "",
        lg = map['lg'] ?? "";
}