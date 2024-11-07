import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_finder/tenant/pg_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/card_large.dart';
import 'detail_view_screen.dart';

class FlatmateScreen extends StatefulWidget {
  @override
  State<FlatmateScreen> createState() => _FlatmateScreenState();

  /// firebase instance
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}

class _FlatmateScreenState extends State<FlatmateScreen> {
  /// -----------------------------Collection Reference ---------------------- ///
  final CollectionReference propertiesRef =
      firebaseFirestore.collection('properties');

  List<DocumentSnapshot> flatMate = [];

  @override
  void initState() {
    super.initState();
    fetchPGProperties();
  }

  /// ------------------------------ CREATE FUNCTION FOR FETCHING DATA -----------------///
  Future<void> fetchPGProperties() async {
    QuerySnapshot snapshot = await propertiesRef
        .where('propertyType', isEqualTo: 'Flat/Room mate')
        .get();
    setState(() {
      flatMate = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flatMate.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: flatMate.length,
              itemBuilder: (context, index) {
                /// data come list of map
                var listing = flatMate[index].data() as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    // Convert image URLs to XFile
                    List<XFile> mediaFiles =
                        (listing['imageUrls'] as List<dynamic>)
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
                                  desc: listing['otherDetails'] ??
                                      'No description available',
                                  type: listing['propertyType'],
                                  bedroom: listing['bedrooms'].toString(),
                                  bathroom: listing['bathrooms'].toString(),
                                  furnishingStatus: listing['furnishingStatus'],
                                  allowed: listing['allowed'],
                                  floor: listing['floor'].toString(),
                                  availability: listing['availableFrom'],
                                  electricity: listing['electricityBill'] ?? "000",
                                  cleaning: listing['cleaningBill'] ?? "000",
                                  water: listing['waterBill'] ?? "000",
                                  securityBill: listing['securityMoney'] ?? "000",
                                )));
                  },
                  child: CardLarge(
                    propertyId: listing['propertyId'],
                    title: listing['title'] ?? "PG Title",
                    rent: 'Rent - ${listing['rent'] ?? 'N/A'}',
                    desc: listing['description'] ?? 'No description available',
                    location: listing['address'] ?? 'Unknown location',
                    imageUrl: listing['imageUrls'][0],
                  ),
                );
              }),
    );
  }
}
