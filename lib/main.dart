import 'package:counting_love_day/app/router/routes.dart';
import 'package:counting_love_day/app/util/depedency.dart';
import 'package:counting_love_day/data/repositories/binding/bindings_repo_impl.dart';
import 'package:counting_love_day/domain/usecase/bindings_usecase.dart';
import 'package:counting_love_day/presentation/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'app/util/language/localization_service.dart';
import 'presentation/controllers/home_controller.dart';

void main() async {
  BindingsRepositoryImpl().dependencies();
  BindingsUsecase().dependencies();
  ManageDependencies().dependencies();

  // await Firebase.initializeApp();
  final SettingController settingController =
      Get.find(tag: "setting_controller");
  String check = await settingController.getDataLanguage() ?? "";
  runApp(
    GetMaterialApp(
      // home: StartApp(),
      translations: LocalizationService(),
      locale: LocalizationService.changeLocale(check),
      fallbackLocale: LocalizationService.fallbackLocale,
      title: "Kapo",
      initialRoute: Routes.startApp,
      getPages: getPages,
    ),
  );
}
