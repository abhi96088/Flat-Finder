import 'package:cloud_firestore/cloud_firestore.dart';

class LanderLoardAddService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> uploadPropertyDetails({
    required String title,
    required String propertyType,
    required String bedrooms,
    required String bathrooms,
    required String furnishingStatus,
    required String allowed,
    required String floor,
    required String availableFrom,
    required String rent,
    String? securityMoney,
    String? electricityBill,
    String? waterBill,
    String? cleaningBill,
    required String address,
    String? otherDetails,
    required List<String> imageUrls,
    required String userId, // Add userId parameter
  }) async {
    try {
      await _db.collection('properties').add({
        'title': title,
        'propertyType': propertyType,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'furnishingStatus': furnishingStatus,
        'allowed': allowed,
        'floor': floor,
        'availableFrom': availableFrom,
        'rent': rent,
        'securityMoney': securityMoney,
        'electricityBill': electricityBill,
        'waterBill': waterBill,
        'cleaningBill': cleaningBill,
        'address': address,
        'otherDetails': otherDetails,
        'imageUrls': imageUrls, // List of image URLs
        'userId': userId, // Store user ID
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Data uploaded successfully!");
    } catch (e) {
      print("Failed to upload data: $e");
    }
  }
}
