import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_finder/widgets/card_large.dart';
import 'package:flutter/material.dart';

class PgScreen extends StatefulWidget {
  const PgScreen({super.key});

  @override
  State<PgScreen> createState() => _PgScreenState();
}

/// -> Firebase -- Rahul
/// ---------------------------- firebase instance -----------------------
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class _PgScreenState extends State<PgScreen> {
  /// --------------------- -------Collection Reference ----------------------///
  final CollectionReference propertiesRef =
      firebaseFirestore.collection('properties');

  List<DocumentSnapshot> pgListing = [];

  @override
  void initState() {
    super.initState();
    fetchPGProperties();
  }

  /// ------------------------------ CREATE FUNCTION FOR FETCHING DATA -----------------///
  Future<void> fetchPGProperties() async {
    QuerySnapshot snapshot =
        await propertiesRef.where('propertyType', isEqualTo: 'PG').get();
    setState(() {
      pgListing = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---------------------------------BODY---------------------------///
      body: pgListing.isEmpty ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: pgListing.length,
          itemBuilder: (context, index) {
            /// data come list of map
            var listing = pgListing[index].data() as Map<String , dynamic> ;
            return  CardLarge(
              title: listing['title'] ?? "PG Title",
              rent: 'Rent - ${listing['rent'] ?? 'N/A'}',
              desc: listing['description'] ?? 'No description available',
              location: listing['address'] ?? 'Unknown location' ,
              imageUrl: listing['imageUrls'][0],
            );
          }) ,

    ) ;
  }
}
