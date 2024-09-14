import 'package:firebase_core/firebase_core.dart';
import 'package:flat_finder/common/add_details_screen.dart';
import 'package:flat_finder/common/add_screen.dart';
import 'package:flat_finder/common/chat_screen.dart';
import 'package:flat_finder/common/login_and_signup/login_screen.dart';
import 'package:flat_finder/common/login_and_signup/signup_screen.dart';
import 'package:flat_finder/common/splace_screen.dart';
import 'package:flat_finder/landlord/bottom_navigation_landlord.dart';
import 'package:flat_finder/tenant/bottom_navigation_tenant.dart';
import 'package:flat_finder/tenant/flat_screen.dart';
import 'package:flat_finder/tenant/home_Screen.dart';
import 'package:flat_finder/tenant/search_screen.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
