import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskfive/app/data/onboarding/onboarding_items.dart';
import 'package:taskfive/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:taskfive/app/modules/onboarding/view/widgets/onboarding_page.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// PageView
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: onboardingPages.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    items: onboardingPages[index],
                  );
                },
              ),
            ),

            /// Dots
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.totalPages,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentPageIndex.value == index ? 24 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: controller.currentPageIndex.value == index
                          ? Colors.orange
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  child: Obx(
                    () => Text(
                      controller.currentPageIndex.value ==
                              controller.totalPages - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ),
              ),
            ),

            // TextButton(
            //   onPressed: controller.skipOnboarding,
            //   child: const Text("Skip"),
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
