import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/colors.dart';

class DetailViewScreen extends StatelessWidget {
  final List<XFile> media;
  final String title;
  final String location;
  final String rent;
  final XFile dp;
  final String desc;
  final String type;
  final String bedroom;
  final String bathroom;
  final String furnishingStatus;
  final String allowed;
  final String floor;
  final String availability;
  final String? electricity;
  final String? water;
  final String? cleaning;

  const DetailViewScreen({
    Key? key,
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
    required this.availability,
    this.electricity,
    this.water,
    this.cleaning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Display the main image
              SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    dp.path,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 10,),

              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Expanded(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                            crossAxisSpacing: 11
                      ),
                      itemCount: media.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(media[index].path),
                                  fit: BoxFit.cover)),
                        ); // Use Image.network for all images
                      },
                    ),
                  ),
                ),
              ),


              // Other property details
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors().darkGreen,
                          fontFamily: "Poppins-Semibold",
                        ),
                      ),
                      // Location and rent
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/location_outlined.svg", width: 15, height: 25),
                          const SizedBox(width: 7),
                          Text(
                            location,
                            style: TextStyle(color: AppColors().darkGrey, fontFamily: "Poppins-Semibold"),
                          ),
                          const Spacer(),
                          Text("Rent - ₹$rent")
                        ],
                      ),

                      const Divider(thickness: 2),
                      // Landlord profile
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(File(dp.path)), // Use XFile for dp
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Abhimanyu Kumar",
                            style: TextStyle(color: AppColors().darkGreen, fontFamily: "Poppins-Semibold", fontSize: 16),
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () {
                              // Send to profile screen of landlord
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors().green70),
                              side: MaterialStateProperty.all(BorderSide(color: AppColors().darkGreen, width: 2)),
                            ),
                            child: Row(
                              children: [
                                Text("View", style: TextStyle(color: AppColors().darkGreen, fontFamily: "Poppins-Semibold")),
                                Icon(Icons.keyboard_arrow_right, color: AppColors().darkGreen),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 2),
                      const Text("Details"),
                      Text(desc),
                      // Additional property details
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
                              Text("    :   $type"),
                              Text("    :   $bedroom"),
                              Text("    :   $bathroom"),
                              Text("    :   $furnishingStatus"),
                              Text("    :   $allowed"),
                              Text("    :   $floor"),
                              const Text("    : "),
                              const Text("    : "),
                              const Text("    : "),
                              Text("    : $availability"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

          // Chat and Direction buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () {
                      // Redirect user to the landlord's chat screen
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                      side: MaterialStateProperty.all(BorderSide(color: AppColors().darkBlue, width: 2)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/chat.svg", width: 30, height: 30),
                        const SizedBox(width: 10),
                        Text("Chat", style: TextStyle(color: AppColors().blue, fontFamily: "Poppins-Semibold", fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      // Redirect user to Google Maps with property location
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors().blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                      side: MaterialStateProperty.all(BorderSide(color: AppColors().darkBlue, width: 2)),
                    ),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: const Icon(Icons.directions, color: Colors.white, size: 30),
                          ),
                          const Text("Direction", style: TextStyle(color: Colors.white, fontFamily: "Poppins-Semibold", fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),

                // Display all media files in a list or grid
              ],
            ),
          )]),
        ),
      ),
    );
  }
}
