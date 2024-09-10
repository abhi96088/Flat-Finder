import 'package:flat_finder/common/chat_screen.dart';
import 'package:flat_finder/common/login_screen.dart';
import 'package:flat_finder/common/profile_screen.dart';
import 'package:flat_finder/common/signup_screen.dart';
import 'package:flat_finder/common/splace_screen.dart';
import 'package:flat_finder/landlord/bottom_navigation_landlord.dart';
import 'package:flat_finder/tenant/bottom_navigation_tenant.dart';
import 'package:flat_finder/tenant/flat_screen.dart';
import 'package:flat_finder/tenant/home_Screen.dart';
import 'package:flat_finder/tenant/saved_screen.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors().green));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigationLandlord()
    );
  }
}
