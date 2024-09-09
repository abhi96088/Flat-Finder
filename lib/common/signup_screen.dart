import 'package:flat_finder/common/login_screen.dart';
import 'package:flat_finder/widgets/custom_text_field.dart';
import 'package:flat_finder/widgets/full_width_button.dart';
import 'package:flat_finder/widgets/half_width_outlined_button.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/login_signup_small_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // This Container contains upper part design which have back and login button
                Container(
                  color: AppColors().green, // Setting custom color for background
                  child: Row(
            
                    children: [
                      // Predefined button
                      const BackButton(
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Text("Already have an account ?", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9), fontFamily: 'Inter'),),
                      // Lower section contains the signup button
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 5),
                        child: LoginSignupSmallButton(
                          text: "Login",
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // This container contain the big title text "Flat Finder"
                Container(
                  width: double.infinity,
                  height: 150,
                  color: AppColors().green,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Flat Finder",
                        style: TextStyle(
                            fontSize: 70,
                            fontFamily:'Poppins-Semibold',
                            color: Colors.white,
                            shadows:[
                              Shadow(
                                  offset: Offset(2.0, 5.0),
                                  blurRadius: 5.0,
                                  color: Colors.black54
                              )
                            ]
                        ),),
                    ),
                  ),
            
                ),
                // below part contains all the fields and buttons
                Transform.translate(
                    offset: const Offset(0, -20),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, -10),
                              blurRadius: 10,
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10,),
                          const Text("Get started for free", style: TextStyle(fontSize: 30, fontFamily: "Poppins-Semibold"),),
                          const SizedBox(height: 5 ,),
                          Text("Enter your details below", style: TextStyle(fontSize: 15, fontFamily: "Poppins-Regular", color: AppColors().grey),),
                          const SizedBox(height: 10,),
                          // this column contains select type account and select gender radio buttons
                          const Column(
                              children:[
                                // select account type
                                SizedBox(
                                  width: 350,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Select Account Type",),
                                      Row(
                                        children: [
                                          Radio(value: "Landlord", groupValue: "Account Type", onChanged:null),
                                          Text("Landlord"),
                                          SizedBox(width: 50,),
                                          Radio(value: "Tenant", groupValue: "Account Type", onChanged:null),
                                          Text("Renter"),],
                                      )
                                    ],
                                  ),
                                ),
                                // select gender
                                SizedBox(
                                  width: 350,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Select Your Gender",),
                                      Row(
                                        children: [
                                          Radio(value: "Male", groupValue: "Gender", onChanged:null),
                                          Text("Male"),
                                          SizedBox(width: 30,),
                                          Radio(value: "Female", groupValue: "Gender", onChanged:null),
                                          Text("Female"),
                                          SizedBox(width: 30,),
                                          Radio(value: "Other", groupValue: "Gender", onChanged:null),
                                          Text("Other"),],
                                      )
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          // this sizedbox contains name field
                          SizedBox(
                            width: 350,
                              child: CustomTextField(
                                  label: "Enter Name",
                                  textController: nameController,
                                prefixIcon: Icon(Icons.person_2_outlined, color: AppColors().green,),
                              )
                          ),
                          const SizedBox(height: 10,),
                          // this sizedbox contains email field
                          SizedBox(
                            width: 350,
                            child: CustomTextField(
                                label: "Enter Email Address",
                                textController: emailController,
                              prefixIcon: Icon(Icons.email_outlined, color: AppColors().green,),
                            )
                          ),
                          const SizedBox(height: 10,),
                          // this sizedbox contains password field
                          SizedBox(
                            width: 350,
                            child: CustomTextField(
                              label: "Enter Password",
                              textController: passController,
                              prefixIcon: Icon(Icons.lock, color: AppColors().green,),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: Icon( isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,)
                              ),
                              obscureText: isVisible,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          // this sizedbox contains confirm password field
                          SizedBox(
                            width: 350,
                            child: CustomTextField(
                                label: "Confirm Password",
                                textController: confirmPassController,
                                prefixIcon: Icon(Icons.lock_open, color: AppColors().green,),
                            )
                                      ),
                          const SizedBox(height: 10,),
                          // this sizedbox contains sign up button
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: FullWidthButton(
                                text: "Sign Up",
                                onPressed: (){}
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text("------------------------- Or login with -------------------------", style: TextStyle(color: AppColors().grey),),
                          const SizedBox(height: 10,),
                          // this sizedbox contains google and facebook buttons
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HalfWidthOutlinedButton(
                                    text: "Google",
                                    iconPath: "assets/icons/google.svg",
                                    onPressed: (){}),
                                const Spacer(),
                                HalfWidthOutlinedButton(
                                    text: "Facebook",
                                    iconPath: "assets/icons/facebook.svg",
                                    onPressed: (){})
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ),
    );
  }
}
