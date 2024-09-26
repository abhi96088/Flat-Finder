import 'dart:io';

import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({super.key,
    required this.media,
    required this.title,
    required this.location,
    required this.rent,
    required this.dp,
    required this.desc,
    required this.type,
    required this.bedroom,
    required this.bathroom,
    required this.furnishingStatus,
    required this.allowed,
    required this.floor,
    this.electricity = "Free",
    this.water = "Free",
    this.cleaning = "Free",
    required this.availability

  });

  final List<XFile> ? media;
  final String title;
  final String location;
  final String rent;
  final String dp;
  final String desc;
  final String type;
  final String bedroom;
  final String bathroom;
  final String furnishingStatus;
  final String allowed;
  final String floor;
  final String electricity;
  final String water;
  final String cleaning;
  final String availability;

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
                            /// there will be the list of images and videos uploaded by landLord
                            Image.file(File(widget.media![0].path), fit: BoxFit.cover,),
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
                                    icon: const Icon(Icons.chevron_left_rounded, size: 80,)
                                )
                            ),
                            // increment index of images list when pressed on this button
                            Positioned(
                                top: 110,
                                right: -25,
                                child: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.chevron_right_rounded, size: 80,)
                                )
                            ),
                            // triple dot which indicates there is more images
                            Positioned(
                                left: 160,
                                bottom: -25,
                                child: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.more_horiz_outlined, size: 80,)
                                )
                            )
                        ]
                      )
                  ),
                  // this text widget holds title of the listed property
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(widget.title, style: TextStyle(fontSize: 30, color: AppColors().darkGreen, fontFamily: "Poppins-Semibold"),),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/location_outlined.svg", width: 15,height: 25,),
                      const SizedBox(width: 7,),
                      Text(widget.location, style: TextStyle(color: AppColors().darkGrey, fontFamily: "Poppins-Semibold"),),
                      const Spacer(),
                      Text("Rent - ₹${widget.rent}")
                    ],
                  ),
                  const Divider(thickness: 2,),
                  // profile, name and view profile button of landlord
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(widget.dp),
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
                  Text(widget.desc, style: TextStyle(color: AppColors().darkGrey, fontFamily: "Poppins_Regular"),),
                  const SizedBox(height: 10,),
                  // all other details
                  Row(
                    children: [
                      const Column(
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
                          Text("    : ${widget.type}"),
                          Text("    : ${widget.bedroom}"),
                          Text("    : ${widget.bathroom}"),
                          Text("    : ${widget.furnishingStatus}"),
                          Text("    : ${widget.allowed}"),
                          Text("    : ${widget.floor}"),
                          Text("    : ${widget.electricity}"),
                          Text("    : ${widget.water}"),
                          Text("    : ${widget.cleaning}"),
                          Text("    : ${widget.availability}"),
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
