import 'package:counting_love_day/app/router/routes.dart';
import 'package:counting_love_day/app/util/depedency.dart';
import 'package:counting_love_day/data/repositories/bindings_repo_impl.dart';
import 'package:counting_love_day/domain/usecase/bindings_usecase.dart';
import 'package:counting_love_day/presentation/components/start_app.dart';
import 'package:counting_love_day/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  BindingsRepositoryImpl().dependencies();
  BindingsUsecase().dependencies();
  ManageDependencies().dependencies();

  // await Firebase.initializeApp();

  runApp(
    const GetMaterialApp(
      home: StartApp(),
      title: "Kapo",
      // initialRoute: Routes.loginScreen,
      // getPages: getPages,
    ),
  );
}
