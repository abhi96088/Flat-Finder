import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({super.key});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // this sizedBox has the images, bookmark icon and navigation icons on image
                  SizedBox(
                      width: double.maxFinite,
                      height: 300,
                      child: Stack(
                        alignment: Alignment.center,
                          children:[
                            // there will be the list of images and videos uploaded by landLord
                            Image.asset("assets/images/flat_image.jpg", fit: BoxFit.cover,),
                            Positioned(
                                right: 10,
                                top: 10,
                                child: IconButton(
                                    onPressed: (){
                                      // when clicked on this icon, change icon to "unsave_icon.svg" and list this property to user's saved screen
                                    },
                                    icon: SvgPicture.asset("assets/icons/bookmark.svg", width: 40, height: 40,)
                                )
                            ),
                            // decrement index of images list when pressed on this button
                            Positioned(
                                top: 110,
                                left: -25,
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.chevron_left_rounded, size: 80,)
                                )
                            ),
                            // increment index of images list when pressed on this button
                            Positioned(
                                top: 110,
                                right: -25,
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.chevron_right_rounded, size: 80,)
                                )
                            ),
                            // triple dot which indicates there is more images
                            Positioned(
                                left: 160,
                                bottom: -25,
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.more_horiz_outlined, size: 80,)
                                )
                            )
                        ]
                      )
                  ),
                  // this text widget holds title of the listed property
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("2 BHK fully furnished flat available", style: TextStyle(fontSize: 30, color: AppColors().darkGreen, fontFamily: "Poppins-Semibold"),),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/location_outlined.svg", width: 15,height: 25,),
                      const SizedBox(width: 7,),
                      Text("New Garden Colony, Kharar", style: TextStyle(color: AppColors().darkGrey, fontFamily: "Poppins-Semibold"),),
                      const Spacer(),
                      const Text("Rent - ₹15000")
                    ],
                  ),
                  const Divider(thickness: 2,),
                  // profile, name and view profile button of landlord
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/dp.jpg"),
                      ),
                      const SizedBox(width: 10,),
                      Text("Abhimanyu Kumar", style: TextStyle(color: AppColors().darkGreen, fontFamily: "Poppins-Semibold", fontSize: 16),),
                      const Spacer(),
                      OutlinedButton(
                          onPressed: (){
                            // send to profile screen of landlord when tapped on this button
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(AppColors().green70),
                            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(11)))),
                            side: WidgetStatePropertyAll(BorderSide(color: AppColors().darkGreen, width: 2))
                          ),
                          child: Row(
                            children: [
                              Text("View", style: TextStyle(color: AppColors().darkGreen, fontFamily: "Poppins-Semibold"),),
                              Icon(Icons.keyboard_arrow_right, weight: 2, color: AppColors().darkGreen,)
                            ],
                          ))
                    ],
                  ),
                  const Divider(thickness: 2,),
                  Text("Details", style: TextStyle(color: AppColors().darkGreen, fontSize: 25, fontFamily: "Poppins-Semibold"),),
                  // description text is here, there is 3-4 visible lines of description text and rest of the lines will appear when user will click on See more...
                  Text("Fully furnished 2bhk flat with AC, Fridge, Wifi, R.O, Bed, Almirah and all other facilities fully independent "
                      "couple friendly, no restriction.Condition - You have to submit id proof and a security money of 5000 rupees which "
                      "is refundable . . . . . . See more", style: TextStyle(color: AppColors().darkGrey, fontFamily: "Poppins_Regular"),),
                  const SizedBox(height: 10,),
                  // all other details
                  const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TYPE"),
                          Text("BEDROOM"),
                          Text("BATHROOM"),
                          Text("FURNISHING STATUS"),
                          Text("WHO'S ALLOWED"),
                          Text("FLOOR NO"),
                          Text("ELECTRICITY BILL"),
                          Text("WATER BILL"),
                          Text("CLEANING"),
                          Text("AVAILABLE FROM"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("    : 2bhk"),
                          Text("    : 2"),
                          Text("    : 2"),
                          Text("    : Furnished"),
                          Text("    : Bachelors"),
                          Text("    : 2"),
                          Text("    : 8₹/Unit"),
                          Text("    : 100₹"),
                          Text("    : 100₹"),
                          Text("    : 18/10/2024"),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: OutlinedButton(
                            onPressed: (){
                              // redirect user to the landlord's chat screen, when this button is pressed
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                              side: WidgetStatePropertyAll(BorderSide(color: AppColors().darkBlue, width: 2))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/chat.svg", width: 30, height: 30,),
                                const SizedBox(width: 10,),
                                Text("Chat", style: TextStyle(color: AppColors().blue, fontFamily: "Poppins-Semibold", fontSize: 20),)
                              ],
                            )
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: (){
                              // redirect user to google map with property location
                            },
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(AppColors().blue),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                                side: WidgetStatePropertyAll(BorderSide(color: AppColors().darkBlue, width: 2))
                            ),
                            child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                   Transform.translate(
                                      offset: const Offset(-10, 0),
                                      child: const Icon(Icons.directions, color: Colors.white, size: 30,)),
                                  const Text("Direction", style: TextStyle(color: Colors.white, fontFamily: "Poppins-Semibold", fontSize: 20),)
                                ],
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,)
        
                ],
                    ),
            )),
      ),
    );
  }
}
