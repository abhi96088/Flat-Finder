import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/card_small_squre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // Profile picture, navigation drawer button, and share button
          SizedBox(
            width: double.maxFinite,
            child: Stack(alignment: Alignment.center, children: [
              // Profile picture
              Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/dp.jpg",
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  )),
              Positioned(
                bottom: 10,
                right: 115,
                child: CircleAvatar(
                  minRadius: 10,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppColors().blue,
                      )),
                ),
              ),
              // Menu icon for navigation drawer
              Positioned(
                  top: 40,
                  left: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_rounded,
                      color: AppColors().green,
                      size: 45,
                    ),
                  )),
              // Share button
              Positioned(
                  top: 45,
                  right: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: AppColors().green,
                      size: 43,
                    ),
                  )),
            ]),
          ),
          const SizedBox(height: 10),
          const Text(
            "Abhimanyu Kumar",
            style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 25),
          ),
          const SizedBox(height: 10),
          // Edit profile button
          SizedBox(
            width: 160,
            height: 45,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors().green),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppColors().blue,
                      size: 25,
                    ),
                    const Spacer(),
                    Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 16, color: AppColors().blue),
                    )
                  ],
                )),
          ),
          const SizedBox(height: 10),

          /// ---- Card for email and phone number  ----
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
              height: 100,
              child: Card(
                color: Colors.blueAccent.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          flex: 3,
                          // email, phone number
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins-Medium"),
                                  )
                                ],
                              ),
                              Text(
                                "abhimanyukumar2464@gmail.com",
                                style: TextStyle(
                                    color: AppColors().darkGrey, fontSize: 12),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins-Medium"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "+91 9608893754",
                                style: TextStyle(color: AppColors().darkGrey),
                              )
                            ],
                          )),
                      // this section contains social media verification section
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Verify With",
                                style: TextStyle(
                                    color: AppColors().blue,
                                    fontFamily: "Poppins-Regular"),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              // contains all three icons
                              Transform.translate(
                                offset: const Offset(10, 0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.facebook,
                                            color: Colors.indigoAccent,
                                            size: 35,
                                          )),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(5, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            "assets/icons/whatsapp.svg",
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(-10, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            "assets/icons/instagram.svg",
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Green bar with list icon and "My Listing" title
          Container(
            width: double.maxFinite,
            height: 40,
            color: AppColors().green,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.list,
                    color: AppColors().darkGreen,
                    size: 40,
                  ),
                ),
                Text(
                  "My Listing",
                  style: TextStyle(
                      color: AppColors().darkGreen,
                      fontSize: 20,
                      fontFamily: "Poppins-Semibold"),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 10, // Replace with actual item count
            itemBuilder: (context, index) {
              return const CardSmallSqure(
                title: 'Need a Flatmate',
                rent: 'Rs-7500',
                desc: 'Need a flatmate in a luxury 2b . . .',
              );
            },
          ),
        ],
      ),
    ));
  }
}
