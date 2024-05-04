import 'package:counting_love_day/app/router/routes.dart';
import 'package:counting_love_day/app/util/util_depedency.dart';
import 'package:counting_love_day/data/repositories/binding/bindings_repo_impl.dart';
import 'package:counting_love_day/domain/usecases/bindings_usecase.dart';
import 'package:counting_love_day/presentation/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/services/language/localization_service.dart';

void main() async {
  BindingsRepositoryImpl().dependencies();
  BindingsUsecase().dependencies();
  ManageDependencies().dependencies();

  final SettingController settingController =
      Get.find(tag: "setting_controller");
  String check = await settingController.getDataLanguage() ?? "";

  runApp(
    GetMaterialApp(
      translations: LocalizationService(),
      locale: LocalizationService.changeLocale(check),
      fallbackLocale: LocalizationService.fallbackLocale,
      title: "Kapo",
      initialRoute: Routes.startApp,
      getPages: getPages,
    ),
  );
}
