import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loakin/home/final_mainscreen.dart';
import 'package:loakin/pages/addpages.dart';
import 'package:loakin/pages/after_splash.dart';
import 'package:loakin/pages/profilepage.dart';
import 'package:loakin/pages/recommend_item_detail.dart';
import 'package:loakin/pages/recommend_item_details.dart';
import 'package:loakin/pages/signin.dart';
import 'package:loakin/pages/signup.dart';
import 'home/main_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AfterSplash(),
    );
  }
}
