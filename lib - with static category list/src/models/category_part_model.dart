class CategoryPart {
  late String name, imgName;
  bool isSelected = false;

  CategoryPart(
      {required this.name, required this.imgName, required this.isSelected});

  factory CategoryPart.fromJson(Map<String, dynamic> json) {
    return CategoryPart(
        name: json['name'], imgName: json['imgName'], isSelected: false);
  }

  static List<CategoryPart> fromJsonArray(List<dynamic> jsonParts) {
    List<CategoryPart> parts = [];

    jsonParts.forEach((jsonData) {
      parts.add(CategoryPart.fromJson(jsonData));
    });

    return parts;
  }
}
