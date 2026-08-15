import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  final int id;
  final String name;
  final String image;
  final String cuisine;
  final String difficulty;
  final int cookTimeMinutes;
  final int rating;
  final int reviewCount;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.cuisine,
    required this.difficulty,
    required this.cookTimeMinutes,
    required this.rating,
    required this.reviewCount,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
