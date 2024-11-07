import 'package:flat_finder/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(emailLaunchUri);
  }

  Future<void> _sendMessage(String phoneNumber) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(smsLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyIconButton(
              mIcon: Icons.arrow_back_ios_outlined,
              onPress: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Version 1.0.0",
                style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: "Poppins-Semibold"),
              ),
              const SizedBox(height: 10),
              const Text(
                "About",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: "Poppins-Semibold"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flat Finder helps you find the best flats and rental properties in your area. Browse, bookmark, and compare properties to find your perfect home with ease.",
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Semibold"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Contact Us",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: "Poppins-Semibold"),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Abhimanyu ------------------------------>
                  Card(
                    color: Colors.yellowAccent.shade100.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/dp.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          const Text(
                            "Abhimanyu kumar",
                            style: TextStyle(fontSize: 16, fontFamily: "Poppins-Semibold"),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "Frontend Developer",
                            style: TextStyle(fontSize: 12, fontFamily: "Poppins-Semibold"),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => _sendEmail("abhimanyukumar2464@gmail.com"),
                                icon: const Icon(Icons.email_outlined, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () => _makePhoneCall("9608893754"),
                                icon: const Icon(Icons.call, color: Colors.green),
                              ),
                              IconButton(
                                onPressed: () => _sendMessage("9608893754"),
                                icon: const Icon(Icons.message, color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Rahul --------------------->
                  Card(
                    color: Colors.yellowAccent.shade100.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/devrahul.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          const Text(
                            "Rahul kumar Sahu",
                            style: TextStyle(fontSize: 16, fontFamily: "Poppins-Semibold"),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "Backend Developer",
                            style: TextStyle(fontSize: 12, fontFamily: "Poppins-Semibold"),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => _sendEmail("rkrahulroy151617@gmail.com"),
                                icon: const Icon(Icons.email_outlined, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () => _makePhoneCall("7970989057"),
                                icon: const Icon(Icons.call, color: Colors.green),
                              ),
                              IconButton(
                                onPressed: () => _sendMessage("7970989057"),
                                icon: const Icon(Icons.message, color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
