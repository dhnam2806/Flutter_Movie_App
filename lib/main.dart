import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movieapp/const/colors.dart';
import 'package:movieapp/pages/home_page.dart';
import 'package:movieapp/pages/main_page.dart';
import 'package:movieapp/pages/sign_in_page.dart';
import 'package:movieapp/pages/movie_detail.dart';
import 'package:movieapp/pages/popular_page.dart';
import 'package:movieapp/pages/search_page.dart';
import 'package:movieapp/pages/sign_up_page.dart';
import 'package:movieapp/pages/trending_page.dart';

import 'models/movie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
      ),
      // home: const HomePage(),
      home: const SignUpPage(),
      // home: MainPage(),
    );
  }
}
