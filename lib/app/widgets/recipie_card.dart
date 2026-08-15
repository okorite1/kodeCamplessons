import 'package:flutter/material.dart';
import 'package:taskfive/app/data/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe image
          Image.network(
            recipe.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,

            // Loading image
            loadingBuilder:
                (
                  context,
                  child,
                  loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },

            // Image error
            errorBuilder:
                (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                      ),
                    ),
                  );
                },
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe name
                Text(
                  recipe.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Cuisine
                Row(
                  children: [
                    const Icon(
                      Icons.public,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      recipe.cuisine,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Difficulty badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getDifficultyColor(
                      recipe.difficulty,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    recipe.difficulty,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Recipe information
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${recipe.cookTimeMinutes} min',
                    ),

                    const SizedBox(width: 18),

                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${recipe.rating}',
                    ),

                    const SizedBox(width: 18),

                    const Icon(
                      Icons.reviews_outlined,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${recipe.reviewCount}',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;

      case 'medium':
        return Colors.orange;

      case 'hard':
        return Colors.red;

      default:
        return Colors.grey;
    }
  }
}
