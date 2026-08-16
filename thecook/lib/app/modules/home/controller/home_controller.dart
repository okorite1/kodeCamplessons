import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thecook/app/data/models/recipe_model.dart';
import 'package:thecook/services/networks/api_services.dart';

class HomeController extends GetxController {
  final ApiService apiService = Get.put<ApiService>(ApiService());

  final RxList<Recipe> recipes = <Recipe>[].obs;

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final data = await apiService.fetchRecipes();

      final recipeList = data.map((json) => Recipe.fromJson(json)).toList();

      recipes.assignAll(recipeList);
    } on DioException catch (e) {
      errorMessage.value = e.error?.toString() ?? 'Unable to load recipes.';
    } catch (e) {
      errorMessage.value = 'Something went wrong. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  void retryFetchRecipes() {
    fetchRecipes();
  }
}
