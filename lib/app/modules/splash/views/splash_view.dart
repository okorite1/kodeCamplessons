import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskfive/app/modules/splash/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          // Show error if something went wrong
          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(controller.errorMessage.value)],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.teal,
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/052/793/073/small/chef-logo-design-vector.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'MR COOK',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                // Spinner - shows ONLY when isLoading is true
                if (controller.isLoading.value)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
