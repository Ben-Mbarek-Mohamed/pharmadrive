class CategoriesModel {
  final String id;
  final String category;
  final String file;

  CategoriesModel({
    this.id,
    this.category,
    this.file,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id_category'],
      category: json['category'],
      file: json['file'],
    );
  }
}
