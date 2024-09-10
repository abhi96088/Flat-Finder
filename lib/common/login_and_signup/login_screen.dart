import 'package:flat_finder/common/login_and_signup/signup_screen.dart';
import 'package:flat_finder/database/firebase/authentication/authentication_helper.dart';
import 'package:flat_finder/tenant/home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/full_width_button.dart';
import '../../widgets/half_width_outlined_button.dart';
import '../../widgets/login_signup_small_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isVisible = false;

  /// firebase authService instance -> Rahul
  AuthService authService = AuthService();

  ///-------------------------------FUNCTION--------------------------------------------------------
  /// create login function with firebase -> Rahul
  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all the blanks"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final user = await authService.login(email, password);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully Logged In"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Create an account first"),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Sign Up',
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-------------------------------BODY------------------------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // This Container contains upper part design which have back and signup button
              Container(
                color: AppColors().green, // Setting custom color for background
                child: Row(
                  children: [
                    // Predefined button
                    const BackButton(
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                          fontFamily: 'Inter'),
                    ),
                    // Lower section contains the signup button
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 5),
                      child: LoginSignupSmallButton(
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // This container contain the big title text "Flat Finder"
              Container(
                width: double.infinity,
                height: 200,
                color: AppColors().green,
                child: const Center(
                  child: Text(
                    "Flat Finder",
                    style: TextStyle(
                        fontSize: 70,
                        fontFamily: 'Poppins-Semibold',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              offset: Offset(2.0, 5.0),
                              blurRadius: 5.0,
                              color: Colors.black54)
                        ]),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -20),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, -10),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 30, fontFamily: "Poppins-Semibold"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Enter your details below",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins-Regular",
                            color: AppColors().grey),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // this sizedbox contains email field
                      SizedBox(
                          width: 350,
                          child: CustomTextField(
                            label: "Enter Your Email",
                            textController: emailController,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors().green,
                            ),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      // this sizedbox contains password field
                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                            obscureText: !isVisible,
                            label: "Enter Password",
                            textController: passController,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors().green,
                            ),
                            suffixIcon: IconButton(
                              /// apply password hide and unHide -> Rahul
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: isVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility_off_outlined),
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FullWidthButton(
                        text: "Login",
                        onPressed: _login,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text("Forgot your password ?"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "------------------------- Or login with -------------------------",
                        style: TextStyle(color: AppColors().grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // this sizedbox contains google and facebook buttons
                      SizedBox(
                        width: 350,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HalfWidthOutlinedButton(
                              text: "Google",
                              iconPath: "assets/icons/google.svg",
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 54,
                            ),
                            HalfWidthOutlinedButton(
                                text: "Facebook",
                                iconPath: "assets/icons/facebook.svg",
                                onPressed: () {}),
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
