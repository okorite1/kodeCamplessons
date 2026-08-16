import 'package:thecook/core/constants/app_images.dart';
import 'package:thecook/core/constants/app_strings.dart';

class OnboardingItems {
  final String imagePath;
  final String title;
  final String description;

  OnboardingItems({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingItems> onboardingPages = [
  OnboardingItems(
    imagePath: AppImages.onboard1,
    title: AppStrings.title1,
    description: AppStrings.description1,
  ),
  OnboardingItems(
    imagePath: AppImages.onboard2,
    title: AppStrings.title2,
    description: AppStrings.description2,
  ),
  OnboardingItems(
    imagePath: AppImages.onboard3,
    title: AppStrings.title3,
    description: AppStrings.description3,
  ),
];
