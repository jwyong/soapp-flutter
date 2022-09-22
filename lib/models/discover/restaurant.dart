class Restaurant {
  Restaurant(this.id, this.name, this.location, this.cuisine, this.imageUrl,
      this.promotion, this.isFavourite);

  factory Restaurant.fromJson(dynamic json) => Restaurant(
        json['id'],
        json['name'],
        json['location'],
        json['cuisine'],
        json['imageUrl'],
        json['promotion'],
        json['isFavourite'],
      );

  final String id;
  final String name;
  final String location;
  final String cuisine;
  final String imageUrl;
  final int? promotion;
  final bool? isFavourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['location'] = location;
    map['cuisine'] = cuisine;
    map['imageUrl'] = imageUrl;
    map['promotion'] = promotion;
    map['isFavourite'] = isFavourite;
    return map;
  }
}
