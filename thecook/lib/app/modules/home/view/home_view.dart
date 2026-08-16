import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thecook/app/modules/home/controller/home_controller.dart';
import 'package:thecook/app/widgets/recipie_card.dart';
import 'package:thecook/app/widgets/state_widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🍳 Recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: controller.retryFetchRecipes,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: Obx(() {
        // Loading
        if (controller.isLoading.value) {
          return const LoadingWidget();
        }

        // Error
        if (controller.errorMessage.value.isNotEmpty) {
          return ErrorStateWidget(
            message: controller.errorMessage.value,
            onRetry: controller.retryFetchRecipes,
          );
        }

        // Empty
        if (controller.recipes.isEmpty) {
          return EmptyStateWidget(onRefresh: controller.retryFetchRecipes);
        }

        // Success
        return _buildRecipeList();
      }),
    );
  }

  Widget _buildRecipeList() {
    return RefreshIndicator(
      onRefresh: controller.fetchRecipes,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),

        // Required by your instructor
        itemCount: controller.recipes.length,

        itemBuilder: (context, index) {
          final recipe = controller.recipes[index];

          return RecipeCard(recipe: recipe);
        },
      ),
    );
  }
}
