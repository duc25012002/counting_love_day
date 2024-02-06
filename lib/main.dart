import 'package:counting_love_day/presentation/views/authen_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app/util/dependency.dart';

void main() async {
  ManageDependencies().dependencies();
  // await Firebase.initializeApp();

  runApp(
    const GetMaterialApp(
      title: "Counitng love ❤️",
      home: AuthenScreen(),
      
    ),
  );
}
