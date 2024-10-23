import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';
import '../widgets/card_small.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  /// FireStore instance to access the bookmarked properties collection
  final CollectionReference bookmarkedRef =
      FirebaseFirestore.instance.collection('bookmarked_properties');

  /// Data list to hold the bookmarked property documents
  List<DocumentSnapshot> bookmarkedListings = [];

  @override
  void initState() {
    super.initState();
    fetchBookmarkedProperties(); // Fetch bookmarked properties on initialization
  }

  /// Function to fetch bookmarked properties from FireStore
  Future<void> fetchBookmarkedProperties() async {
    try {
      QuerySnapshot snapshot = await bookmarkedRef.get();
      setState(() {
        bookmarkedListings = snapshot.docs; // Store fetched documents
      });
      print(
          'Fetched Bookmarked Properties: ${snapshot.docs.map((e) => e.data())}');
    } catch (e) {
      print('Error fetching bookmarked properties: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors().green,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarked Properties"),
      ),
      body: bookmarkedListings.isEmpty
          ? const Center(child: Text("No bookmarked properties"))
          : ListView.builder(
              itemCount: bookmarkedListings.length,
              itemBuilder: (context, index) {
                var listing =
                    bookmarkedListings[index].data() as Map<String, dynamic>;

                return CardSmall(
                  propertyId: listing['propertyId'],
                  title: listing['title'], // Assuming propertyId is the title
                  rent: listing['rent'] ?? 'No rent available',
                  desc: listing['description'] ?? 'No description available',
                  location: listing['address'] ?? 'No location available',
                  imageUrl: listing['imageUrls'] != null &&
                          listing['imageUrls'].isNotEmpty
                      ? listing['imageUrls'][0]
                      : 'https://via.placeholder.com/150', // Placeholder image
                );
              },
            ),
    );
  }
}
