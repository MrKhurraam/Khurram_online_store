class CategoryPart {
  late String name, imgName;
  bool isSelected = false;

  CategoryPart(
      {required this.name, required this.imgName, required this.isSelected});

  factory CategoryPart.fromJson(Map<String, dynamic> json) {
    return CategoryPart(
        name: json['name'], imgName: json['imgName'], isSelected: false);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgName': imgName,
      'isSelected': isSelected,
    };
  }

  static List<CategoryPart> fromJsonArray(List<dynamic> jsonParts) {
    List<CategoryPart> parts = [];

    jsonParts.forEach((jsonData) {
      if (jsonData != null) parts.add(CategoryPart.fromJson(jsonData));
    });

    return parts;
  }
}
