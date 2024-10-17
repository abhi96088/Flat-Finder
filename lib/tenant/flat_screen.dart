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
                    media: mediaFiles, // Pass the list of XFile
                    title: listing['title'], // Correct key for title
                    location: listing['address'],
                    rent: listing['rent'].toString(), // Convert rent to string if necessary
                    dp: XFile(listing['imageUrls'][0]), // Use XFile for display picture
                    desc: listing['otherDetails'] ?? 'No description available', // Correct key for description
                    type: listing['propertyType'],
                    bedroom: listing['bedrooms'].toString(), // Convert to string if necessary
                    bathroom: listing['bathrooms'].toString(), // Convert to string if necessary
                    furnishingStatus: listing['furnishingStatus'], // Correct key for furnishing status
                    allowed: listing['allowed'], // Correct key for allowed
                    floor: listing['floor'].toString(), // Convert to string if necessary
                    availability: listing['availableFrom'],

                  ),
                ),
              );
            },
            child: CardLarge(
              title: listing['title'], // Correct key for title
              rent: 'Rent - ${listing['rent']}', // Correct key for rent
              desc: listing['otherDetails'] ?? 'No description available', // Correct key for description
              location: listing['address'], // Correct key for location
              imageUrl: listing['imageUrls'][0], // Assuming first image in the list
            ),
          );
        },
      ),
    );
  }
}
