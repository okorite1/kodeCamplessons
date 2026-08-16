import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thecook/routes/app_pages.dart';
import 'package:thecook/services/storage/service_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<ServiceStorage>(
    () => ServiceStorage().init(),
  );

  runApp(
    GetMaterialApp(
      title: 'thecook',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
