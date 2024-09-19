import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileNavigationDrawer extends StatefulWidget {
  const ProfileNavigationDrawer({super.key});

  @override
  State<ProfileNavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<ProfileNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
   return NavigationDrawer(
          backgroundColor: AppColors().blue,
          children: [
            Column(
              children: [
                /// ----> Profile picture of the user <---- ///
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/dp.jpg"),
                ),
                const SizedBox(height: 20,),
                /// ----> Name of the user <---- ///
                const Text("Abhimanyu Kumar", style: TextStyle(fontSize: 25, fontFamily: "Poppins-Semibold", color: Colors.white),),
                // divider
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(thickness: 1.5,),
                ),
                /// ----> All the options of the drawer <---- ///
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      /// ----> Settings <---- ///
                      InkWell(
                        onTap: (){
                          /// --------> Navigate to Settings Screen <-------- ///
                        },
                        child: Row(
                          children: [
                            Icon(Icons.settings, size: 30, color: AppColors().darkGreen,),
                            const SizedBox(width: 10,),
                            const Text("Settings", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins-Semibold"),),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right, size: 30, color: Colors.white,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      /// ----> Invite a Friend <---- ///
                      InkWell(
                        onTap: (){
                          /// --------> Navigate to referral Screen <-------- ///
                        },
                        child: Row(
                          children: [
                            Icon(Icons.group_add_outlined, size: 30, color: AppColors().darkGreen,),
                            const SizedBox(width: 10,),
                            const Text("Invite A Friend", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins-Semibold"),),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right, size: 30, color: Colors.white,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      /// ----> Feedback Form <---- ///
                      InkWell(
                        onTap: (){
                          /// --------> Navigate to Feedback Form <-------- ///
                        },
                        child: Row(
                          children: [
                            Icon(Icons.send, size: 30, color: AppColors().darkGreen,),
                            const SizedBox(width: 10,),
                            const Text("Send Feedback", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins-Semibold"),),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right, size: 30, color: Colors.white,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      /// ----> Help & Support <---- ///
                      InkWell(
                        onTap: (){
                          /// --------> Navigate to Chatbot <-------- ///
                        },
                        child: Row(
                          children: [
                            Icon(Icons.support_agent_sharp, size: 30, color: AppColors().darkGreen,),
                            const SizedBox(width: 10,),
                            const Text("Help & Support", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins-Semibold"),),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right, size: 30, color: Colors.white,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      /// ----> About Us <---- ///
                      InkWell(
                        onTap: (){
                          /// --------> Navigate to About Screen <-------- ///
                        },
                        child: Row(
                          children: [
                            Icon(Icons.info_outlined, size: 30, color: AppColors().darkGreen,),
                            const SizedBox(width: 10,),
                            const Text("About Us", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins-Semibold"),),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right, size: 30, color: Colors.white,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 250,),
                /// ----> Logout Button <---- ///
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OutlinedButton(
                      onPressed: (){

                        /// ---------> Logout the user, change the flag value in shared preferences and navigate to login screen <--------- ///

                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        side: BorderSide(
                            width: 2,
                            color: Colors.red.shade800
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Icon(Icons.power_settings_new, color: Colors.red.shade800, size: 28,),
                            const SizedBox(width: 10,),
                            Text("Logout", style: TextStyle(fontSize: 20, fontFamily: "Poppins-Semibold", color: Colors.red.shade800),),
                            Spacer()
                          ],
                        ),
                      )),
                )
              ],
            )
          ]
      );
  }

}

