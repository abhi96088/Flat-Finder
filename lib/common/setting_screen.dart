import 'package:flat_finder/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isDark = true ;
  bool isNotification = false ;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors().green,
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings' , style: TextStyle(fontFamily: 'Poppins-Bold'),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyIconButton(
              mIcon: Icons.arrow_back_ios_new_sharp,
              buttonBackground: Colors.white,
              onPress: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: AppColors().green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Account Management Section
            const Text(
              'Account Management',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,fontFamily: 'Poppins-Bold'),
            ),
            ListTile(
              title: const Text('Profile', style: TextStyle(fontFamily: 'Poppins-Bold',)),
              subtitle: const Text('Manage your profile information' , style: TextStyle(fontFamily: 'Poppins-Bold',),),
              onTap: () {
                // Navigate to Profile Screen
              },
            ),
            ListTile(
              title: const Text('Change Password' , style: TextStyle(fontFamily: 'Poppins-Bold',),),
              onTap: () {
                // Navigate to Change Password Screen
              },
            ),
            const Divider(),

            // Notifications Section
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,fontFamily: 'Poppins-Bold',),
            ),
            SwitchListTile(
              activeColor: Colors.lightBlueAccent,
              title: const Text('Enable Notifications' , style: TextStyle(fontFamily: 'Poppins-Bold',),),
              value: isNotification ,
              onChanged: (value) {
                setState(() {
                  isNotification = !isNotification ;
                });

              },
            ),
            const Divider(),

            // Theme Section
            const Text(
              'Appearance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Poppins-Bold'),
            ),
            ListTile(
              title: const Text('Select Theme', style: TextStyle(fontFamily: 'Poppins-Bold',)),
              subtitle: const Text('Choose your preferred theme', style: TextStyle(fontFamily: 'Poppins-Bold',)),
              onTap: () {
                // Show theme selection dialog or navigate to theme selection screen
              },

            ),
            SwitchListTile(
              activeColor: Colors.lightBlueAccent,
              title: const Text('Dark them' , style: TextStyle(fontFamily: 'Poppins-Bold',),),
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = !isDark;
                });


              },
            ),
            const Divider(),

            // About Section
            const Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Poppins-Bold'),
            ),
            ListTile(
              title: const Text('Terms of Service', style: TextStyle(fontFamily: 'Poppins-Bold',)),
              onTap: () {
                // Navigate to Terms of Service
              },
            ),
            ListTile(
              title: const Text('Privacy Policy', style: TextStyle(fontFamily: 'Poppins-Bold',)),
              onTap: () {
                // Navigate to Privacy Policy
              },
            ),
            ListTile(
              title: const Text('Help & Support', style: TextStyle(fontFamily: 'Poppins-Bold',)),
              onTap: () {
                // Navigate to Help & Support Screen
              },
            ),
            const Divider(),


          ],
        ),
      ),
    );
  }
}
