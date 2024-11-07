import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flat_finder/common/about_screen.dart';
import 'package:flat_finder/common/help_and_support_screen.dart';
import 'package:flat_finder/common/setting_screen.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileNavigationDrawer extends StatefulWidget {
  const ProfileNavigationDrawer({super.key});

  @override
  State<ProfileNavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<ProfileNavigationDrawer> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Variable to hold the profile image URL
  String? _profileImageUrl;
  File? _profileImage;
  String userName = "Loading..."; // Default value
  String email = "Loading..."; // Default value

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      // Fetch user data from Firestore
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        userName = userDoc['name'];
        email = userDoc['email'];

        if (userDoc.get('profileImageUrl') != null) {
          _profileImageUrl = userDoc.get('profileImageUrl');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(backgroundColor: AppColors().blue, children: [
      Column(
        children: [
          const SizedBox(height: 20,),
          /// ----> Profile picture of the user <---- ///
          SizedBox(
            width: 200,
            height: 200,
            child: ClipOval(
              child: _profileImage != null
                  ? Image.file(
                _profileImage!,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              )
                  : (_profileImageUrl != null
                  ? Image.network(
                _profileImageUrl!,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              )
                  : Image.asset(
                "assets/icons/user (2).png",
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          /// ----> Name of the user <---- ///
           Text(
            userName,
            style: const TextStyle(
                fontSize: 25,
                fontFamily: "Poppins-Semibold",
                color: Colors.white),
          ),
           /// ----------email------------------///
           Text(
            email,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: "Poppins-Semibold",
                color: Colors.white),
          ),
          // divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              thickness: 1.5,
            ),
          ),

          /// ----> All the options of the drawer <---- ///
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                /// ----> Settings <---- ///
                InkWell(
                  onTap: () {
                    /// --------> Navigate to Settings Screen <-------- ///
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                        color: AppColors().darkGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsScreen()));
                        },
                        child: const Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Poppins-Semibold"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// ----> Invite a Friend <---- ///
                InkWell(
                  onTap: () {
                    /// --------> Navigate to referral Screen <-------- ///
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.group_add_outlined,
                        size: 30,
                        color: AppColors().darkGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Invite A Friend",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Poppins-Semibold"),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// ----> Feedback Form <---- ///
                InkWell(
                  onTap: () {
                    /// --------> Navigate to Feedback Form <-------- ///
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.send,
                        size: 30,
                        color: AppColors().darkGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Send Feedback",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Poppins-Semibold"),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// ----> Help & Support <---- ///
                InkWell(
                  onTap: () {
                    /// --------> Navigate to Chatbot <-------- ///
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.support_agent_sharp,
                        size: 30,
                        color: AppColors().darkGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpAndSupportScreen()));
                        },
                        child: const Text(
                          "Help & Support",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Poppins-Semibold"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// ----> About Us <---- ///
                InkWell(
                  onTap: () {
                    /// --------> Navigate to About Screen <-------- ///
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outlined,
                        size: 30,
                        color: AppColors().darkGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "About Us",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Poppins-Semibold"),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),

          /// ----> Logout Button <---- ///
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OutlinedButton(
                onPressed: () {
                  /// ---------> Logout the user, change the flag value in shared preferences and navigate to login screen <--------- ///
                },

                style: OutlinedButton.styleFrom(
                  elevation: 3,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    backgroundColor: Colors.red,
                    side: const BorderSide(width: 2, color: Colors.white),),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                        shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins-Semibold",
                            shadows: [
                              BoxShadow(color: Colors.black, blurRadius: 4)
                            ],
                            color: Colors.white),
                      ),
                    ],
                  ),
                )),
          )
        ],
      )
    ]);
  }
}
