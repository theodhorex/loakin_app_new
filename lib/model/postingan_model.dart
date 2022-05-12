class PostinganModel {
  final String image;
  final String category;
  final String title;
  final String conditions;
  final String price;
  final String description;
  final List dealMethod;

  PostinganModel(
      {required this.category,
      required this.image,
      required this.title,
      required this.conditions,
      required this.price,
      required this.description,
      required this.dealMethod});

  static PostinganModel fromJson(Map<String, dynamic> json) {
    return PostinganModel(
        image: json['image'],
        category: json['category'],
        title: json['title'],
        conditions: json['conditions'],
        price: json['price'],
        description: json['description'],
        dealMethod: json['dealMethod']);
  }

  Map<String, dynamic> toJson() {
    List list = dealMethod.map((e) {
      if (e["value"] != false) {
        return e;
      }
    }).toList();

    // Remove null 
    // var l = list.removeWhere((element) => element == null);

    return {
      "image": image,
      "category": category,
      "title": title,
      "conditions": conditions,
      "price": price,
      "description": description,
      "dealMethod": list
    };
  }
}
