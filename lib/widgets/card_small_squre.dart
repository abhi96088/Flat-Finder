import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';

class CardSmallSqure extends StatefulWidget {
  const CardSmallSqure({super.key,

    required this.imagePath,
    required this.title,
    required this.rent,
    required this.desc,
    required this.location

  });
  /// here we add image path -> Rahul
  final String imagePath ;
  final String title;
  final String rent;
  final String desc;
  final String location;

  @override
  State<CardSmallSqure> createState() => _CardSmallSqureState();
}

class _CardSmallSqureState extends State<CardSmallSqure> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: SizedBox(
        width: 190,
        height: 190,
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              // this container contains image
              Container(
                width: double.maxFinite,
                height: 130,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(widget.imagePath, width: double.maxFinite, fit: BoxFit.cover,),
              ),
              // this widget contains all the Title and text below the image
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: double.maxFinite,
                        child: Text(widget.title, style: const TextStyle(fontSize: 15, fontFamily: "Poppins-Bold"),)
                    ),
                    Row(
                      children: [
                        Text(widget.location, style: TextStyle(color: AppColors().darkGrey, fontFamily: "Poppins-Medium", fontSize: 8)),
                        const Spacer(),
                        Text(widget.rent, style: const TextStyle(fontSize: 10, fontFamily: "Poppins-Semibold"),)
                      ],
                    ),
                    const Divider(),
                    Text(widget.desc, style: TextStyle(fontSize: 8, fontFamily: "Poppins-Medium", color: AppColors().darkGrey),)
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
