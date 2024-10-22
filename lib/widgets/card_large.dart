import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardLarge extends StatefulWidget {
  const CardLarge({
    super.key,
    required this.propertyId,
    required this.title,
    required this.rent,
    required this.desc,
    required this.location,
    required this.imageUrl,
  });

  final String propertyId ;
  final String title ;
  final String rent ;
  final String desc ;
  final String location ;
  final String imageUrl ;

  @override
  State<CardLarge> createState() => _CardLargeState();
}

class _CardLargeState extends State<CardLarge> {
  bool isBookmarked = false;

  /// ------------------------------------- TOGGLE BUTTON ---------------------------------///  
  /// Toggle bookmark function
  toggleBookmark(String propertyId) async {
    final DocumentReference bookmarkRef = FirebaseFirestore.instance
        .collection('bookmarked_properties')
        .doc(propertyId);

    try {
      // Check if the property is already bookmarked
      DocumentSnapshot bookmarkSnapshot = await bookmarkRef.get();

      if (bookmarkSnapshot.exists) {
        // If it exists, bookmark (delete the document)
        await bookmarkRef.delete();
        setState(() {
          isBookmarked = false;
        });
        print('Property bookmarked');
      } else {
        // If it doesn't exist, bookmark it (add the document)
        await bookmarkRef.set({
          'propertyId': propertyId,
          'title': widget.title,
          'timestamp': FieldValue.serverTimestamp(),
          'rent': widget.rent,
          'description': widget.desc,
          'address': widget.location,
          'imageUrls': [widget.imageUrl],
        });
        setState(() {
          isBookmarked = true;
        });
        print('Property bookmarked');
      }
    } catch (e) {
      print('Error toggling bookmark: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData? mqData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.maxFinite,
        height: mqData.size.height * 0.4,
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              // Image and bookmark button
              Container(
                width: double.maxFinite,
                height: 180,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // Main image of the card
                    Image.network(
                      widget.imageUrl,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    // Bookmark button
                    Positioned(
                      left: 8,
                      top: 8,
                      child: GestureDetector(
                        onTap: () async {
                          await toggleBookmark(widget.propertyId);
                        },
                        child: SvgPicture.asset(
                          isBookmarked
                              ? "assets/icons/unsave.svg"
                              : "assets/icons/bookmark.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    // Distance button (optional)
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/location_outlined.svg",
                                width: 28,
                                height: 28,
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                "2.6 km",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Poppins-Semibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Title and description
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        widget.title.toUpperCase(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Poppins-Bold",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.location,
                          style: TextStyle(
                            color: AppColors().darkGrey,
                            fontFamily: "Poppins-Medium",
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.rent,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins-Semibold",
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(
                      widget.desc,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins-Medium",
                        color: AppColors().darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
