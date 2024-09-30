import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardLarge extends StatefulWidget {
  const CardLarge({
    super.key,
    required this.title,
    required this.rent,
    required this.desc,
    required this.location,

    /// here add image url
    required this.imageUrl,
  });

  final String title;
  final String rent;
  final String desc;
  final String location;
  final String imageUrl;

  @override
  State<CardLarge> createState() => _CardLargeState();
}

class _CardLargeState extends State<CardLarge> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              // this container contains image and two button inside stack
              Container(
                width: double.maxFinite,
                height: 180,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // this is the main image of the card
                    Image.network(
                      widget.imageUrl,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    // this positioned contains top bookmark button
                    Positioned(
                      left: 8,
                      top: 8,
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/bookmark.svg",
                            width: 40,
                            height: 40,
                          )),
                    ),
                    // this positioned contains distance button
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          // Add onTap action for the new container
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/location_outlined.svg",
                                  width: 28,
                                  height: 28,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Text(
                                  "2.6 km",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Poppins-Semibold",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // this widget contains all the Title and text below the image
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        /// card title into upper case
                        widget.title.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25, fontFamily: "Poppins-Bold"),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.location,
                          style: TextStyle(
                              color: AppColors().darkGrey,
                              fontFamily: "Poppins-Medium",
                              fontSize: 14),
                        ),
                        const Spacer(),
                        Text(
                          widget.rent,
                          style: const TextStyle(
                              fontSize: 14, fontFamily: "Poppins-Semibold"),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(
                      widget.desc, // Handle null
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins-Medium",
                          color: AppColors().darkGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
