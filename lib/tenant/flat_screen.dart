import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'detail_view_screen.dart';

class FlatScreen extends StatefulWidget {
  const FlatScreen({super.key});

  @override
  State<FlatScreen> createState() => _FlatScreenState();
}

class _FlatScreenState extends State<FlatScreen> {
  /// FireStore instance to access the properties collection
  final CollectionReference propertiesRef = FirebaseFirestore.instance.collection('properties');

  /// Data list to hold the property documents
  List<DocumentSnapshot> userListings = [];

  @override
  void initState() {
    super.initState();
    fetchProperties(); // Fetch properties on initialization
  }

  /// Function to fetch property listings from FireStore
  Future<void> fetchProperties() async {
    try {
      QuerySnapshot snapshot = await propertiesRef.get();
      setState(() {
        userListings = snapshot.docs; // Store fetched documents
      });
    } catch (e) {
      print('Error fetching properties: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userListings.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: userListings.length,
        itemBuilder: (context, index) {
          var listing = userListings[index].data() as Map<String, dynamic>;
          return InkWell(
            onTap: () {
              // Convert image URLs to XFile
              List<XFile> mediaFiles = (listing['imageUrls'] as List<dynamic>)
                  .map((url) => XFile(url))
                  .toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailViewScreen(
                    media: mediaFiles,
                    title: listing['title'],
                    location: listing['address'],
                    rent: listing['rent'].toString(),
                    dp: XFile(listing['imageUrls'][0]),
                    desc: listing['otherDetails'] ?? 'No description available',
                    type: listing['propertyType'],
                    bedroom: listing['bedrooms'].toString(),
                    bathroom: listing['bathrooms'].toString(),
                    furnishingStatus: listing['furnishingStatus'],
                    allowed: listing['allowed'],
                    floor: listing['floor'].toString(),
                    availability: listing['availableFrom'],
                    electricity: listing['electricityBill'] ?? "000",
                    cleaning:  listing['cleaningBill'] ?? "000",
                    water:  listing['waterBill'] ?? "000",
                    securityBill:  listing['securityMoney'] ?? "000",



                  ),
                ),
              );
            },
            child: CardLarge(
              title: listing['title'],
              rent: 'Rent - ${listing['rent']}',
              desc: listing['otherDetails'] ?? 'No description available',
              location: listing['address'],
              imageUrl: listing['imageUrls'][0],

            ),
          );
        },
      ),
    );
  }
}
