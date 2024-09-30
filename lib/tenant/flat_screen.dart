import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';

class FlatScreen extends StatefulWidget {
  const FlatScreen({super.key});

  @override
  State<FlatScreen> createState() => _FlatScreenState();
}

class _FlatScreenState extends State<FlatScreen> {
  /// FireStore instance to access the properties collection -> Rahul
  final CollectionReference propertiesRef = FirebaseFirestore.instance.collection('properties');

  /// Data list to hold the property documents -> Rahul
  List<DocumentSnapshot> userListings = [];

  @override
  void initState() {
    super.initState();
    fetchProperties(); /// Fetch properties on initialization -> Rahul
  }

  /// Function to fetch property listings from FireStore -> Rahul
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
          return CardLarge(
            title: listing['title'],
            rent: 'Rent - ${listing['rent']}',
            desc: '${listing['description']}',
            location: listing['address'],
            imageUrl: listing['imageUrls'][0],
          );
        },
      ),
    );
  }
}
