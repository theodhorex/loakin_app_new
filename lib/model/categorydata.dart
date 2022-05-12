class CategoryModel {
  String? id;
  final String category;

  CategoryModel({required this.category, this.id});

  static CategoryModel fromJson(Map<String, dynamic> json) =>
      CategoryModel(category: json['category']);

  Map<String, dynamic> toJson() => {'id': id, 'category': category};
}
 