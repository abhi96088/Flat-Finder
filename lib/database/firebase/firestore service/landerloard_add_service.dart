import 'package:flutter/material.dart';

class DetailViewScreen extends StatelessWidget {
  final String media;
  final String title;
  final String location;
  final String rent;
  final String dp;
  final String desc;
  final String type;
  final int bedroom;
  final int bathroom;
  final String furnishingStatus;
  final String allowed;
  final int floor;
  final String availability;


  const DetailViewScreen({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(dp), // Load the image using the URL
            Text('Rent: $rent'),
            Text('Location: $location'),
            Text('Bedrooms: $bedroom'),
            Text('Bathrooms: $bathroom'),
            Text('Furnishing Status: $furnishingStatus'),
            Text('Allowed: $allowed'),
            Text('Floor: $floor'),
            Text('Availability: $availability'),
            Text('Description: $desc'),
          ],
        ),
      ),
    );
  }
}
