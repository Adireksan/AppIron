import 'package:flutter/foundation.dart';

class Recipe {
  final int id;
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe({
    required this.id,
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory Recipe.fromJson(dynamic json) {
    // return Recipe(
    //     id: json['id'],
    //     name: json['name'],
    //     images: json['images'],
    //     rating: rating,
    //     totalTime: totalTime);
    return Recipe(
      id: json['id'],
      name: json['name'],
      images: json['images'],
      rating: json['rating'].toDouble(),
      totalTime: json['totalTime'],
    );
  }
}
