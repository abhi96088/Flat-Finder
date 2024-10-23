import 'package:flat_finder/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors().green,
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support', style: TextStyle(fontFamily: 'Poppins-Semibold',),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyIconButton(mIcon: Icons.arrow_back_ios_sharp, onPress: (){
            Navigator.pop(context);
          }),
        ),
        backgroundColor:AppColors().green ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ///------------------ FAQ Section
            const Card(
              elevation: 3,
              shadowColor: Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0 , horizontal: 5),
                child: ExpansionTile(
                  iconColor: Colors.red,
                  collapsedIconColor: Colors.deepPurpleAccent,


                  title: Text(
                    'Frequently Asked Questions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,fontFamily: 'Poppins-Semibold',),
                  ),
                  children: [
                    ListTile(
                      title: Text('How do I search for flats?' , style: TextStyle(fontFamily: 'Poppins-Semibold', color: Colors.blueAccent),),
                      subtitle: Text('You can search for flats using the search bar and filtering options.' , style: TextStyle(fontFamily: 'Poppins-Semibold',),),
                    ),
                    ListTile(
                      title: Text('What should I do if I encounter an issue?', style: TextStyle(fontFamily: 'Poppins-Semibold',color: Colors.blueAccent),),
                      subtitle: Text('Please contact support or check the FAQ section.' , style: TextStyle(fontFamily: 'Poppins-Semibold',),),
                    ),
                    ListTile(
                      title: Text('How do I reset my password?' , style: TextStyle(fontFamily: 'Poppins-Semibold',color: Colors.blueAccent),),
                      subtitle: Text('Use the "Forgot Password" link on the login page.', style: TextStyle(fontFamily: 'Poppins-Semibold',),),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Contact Us Section
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins-Semibold',),
            ),
            const SizedBox(height: 8),
            const Text('Email: support@flatfinder.com' , style: TextStyle(fontFamily: 'Poppins-Semibold',),),
            const SizedBox(height: 4),
            const Text('Phone: +91 9999999999' , style: TextStyle(fontFamily: 'Poppins-Semibold',),),
            const SizedBox(height: 16),

            // Support Resources Section
            const Text(
              'Support Resources',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold  ,fontFamily: 'Poppins-Semibold',),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('User Guide', style: TextStyle(fontFamily: 'Poppins-Semibold',),),
              onTap: () {
                // Navigate to User Guide (could be a PDF or another screen)
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Tutorial Videos' , style: TextStyle(fontFamily: 'Poppins-Semibold',),),
              onTap: () {
                // Navigate to Tutorial Videos
              },
            ),
            ListTile(
              leading: const Icon(Icons.forum),
              title: const Text('Community Forum' , style: TextStyle(fontFamily: 'Poppins-Semibold',),),
              onTap: () {
                // Navigate to Community Forum
              },
            ),
          ],
        ),
      ),
    );
  }
}
