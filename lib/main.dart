import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskfive/app/modules/home/view/home_view.dart';
import 'package:taskfive/routes/app_pages.dart';
import 'package:taskfive/services/storage/service_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => await ServiceStorage().init());
  runApp(
    GetMaterialApp(
      title: "taskfive",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
}
