import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardSmall extends StatefulWidget {
  const CardSmall(
      {super.key,
      required this.title,
      required this.rent,
      required this.desc,
      this.location = "Garden Colony, Kharar"});

  final String title;
  final String rent;
  final String desc;
  final String location;

  @override
  State<CardSmall> createState() => _CardSmallState();
}

class _CardSmallState extends State<CardSmall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: SizedBox(
        width: double.maxFinite,
        height: 135,
        child: Card(
          color: AppColors().blue50,
          child: Flex(
            direction: Axis.horizontal,
            children: [
                // this container contains image and two button inside stack
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration:  const BoxDecoration(
                          // this is the main image of the card
                          image: DecorationImage(image: AssetImage("assets/images/flat_image.jpg" ) , fit: BoxFit.cover  ),
                          borderRadius: BorderRadius.all(Radius.circular(11))
                      ),

                      child: Stack(children: [
                        // this positioned contains top bookmark button
                        Positioned(
                            left: 5,
                            top: 5,
                            child: GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/icons/unsave.svg",
                                  width: 30,
                                  height: 30,
                                ))),
                      ]),
                    ),
                  ),
                ),
                // this widget contains all the Title and text below the image
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0, right: 8.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 25, fontFamily: "Poppins-Semibold", color: AppColors().darkGreen),
                          ),
                          Text(widget.desc,
                              style: TextStyle(
                                  color: AppColors().darkGreen,
                                  fontFamily: "Poppins-Medium",
                                  fontSize: 12)),
                          const Divider(),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/location.svg", width: 20, height: 20,),
                              const SizedBox(width: 5,),
                              Text(
                                widget.location,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Poppins-Medium",
                                    color: AppColors().darkGreen),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    widget.rent,
                                    style: const TextStyle(
                                        fontSize: 14, fontFamily: "Poppins-Semibold"),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                    ),
                  ),
                )
            ]
          ),
        ),
      ),
    );
  }
}
