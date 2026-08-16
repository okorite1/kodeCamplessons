// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  cuisine: json['cuisine'] as String,
  difficulty: json['difficulty'] as String,
  cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
  rating: (json['rating'] as num).toInt(),
  reviewCount: (json['reviewCount'] as num).toInt(),
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'cuisine': instance.cuisine,
  'difficulty': instance.difficulty,
  'cookTimeMinutes': instance.cookTimeMinutes,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
};
