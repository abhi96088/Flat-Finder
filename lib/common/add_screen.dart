import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flat_finder/common/add_details_screen.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final ImagePicker _picker = ImagePicker(); // Object to manage media picking from camera or gallery
  List<XFile>? _selectedMedia = []; // List to store selected images

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pickImages(); // Open media picker as soon as the screen loads
    });
  }

  // Method to pick multiple images from the gallery
  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage(); // Pick multiple images
    if (images != null) {
      setState(() {
        _selectedMedia = images;
      });
    }
  }

  // Method to upload images to Firebase Storage
  Future<List<String>> uploadImages(List<XFile> images) async {
    List<String> imageUrls = [];
    final storage = FirebaseStorage.instance;

    for (var image in images) {
      try {
        final file = File(image.path);
        final ref = storage.ref().child('property_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        final uploadTask = ref.putFile(file);

        // Await the upload to complete
        final snapshot = await uploadTask;
        final downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        print("Failed to upload image: $e");
      }
    }
    return imageUrls;
  }

  // Handle the "Next" button press
  Future<void> handleNextButtonPress() async {
    if (_selectedMedia != null && _selectedMedia!.isNotEmpty) {
      try {
        // Upload images and get their URLs
        List<String> imageUrls = await uploadImages(_selectedMedia!);

        // Navigate to the AddDetailsScreen with the image URLs
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddDetailsScreen(imageFromAddScreen: _selectedMedia),
          ),
        );
      } catch (e) {
        print("Failed to upload images and navigate: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload images')),
        );
      }
    } else {
      // Handle the case where no images are selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No images selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().green,
        title: Text(
          'Select Images and Videos',
          style: TextStyle(
              color: AppColors().darkGreen,
              fontSize: 22,
              fontFamily: "Poppins-Regular"),
        ),
        actions: [
          TextButton(
            onPressed: handleNextButtonPress, // Handle the button press
            child: Text(
              "Next",
              style: TextStyle(
                color: AppColors().blue,
                fontSize: 20,
                fontFamily: "Poppins-Medium",
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Camera button
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () async {
                    final XFile? image = await _picker.pickImage(
                        source: ImageSource.camera); // Capture an image using the camera
                    if (image != null) {
                      setState(() {
                        _selectedMedia!.add(image);
                      });
                    }
                  },
                ),
                // Gallery button
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: pickImages, // Opens the gallery to pick multiple images
                ),
              ],
            ),
          ),
          Expanded(
            // A grid to display selected images
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: _selectedMedia!.length, // Number of images in the list
              itemBuilder: (context, index) {
                return Image.file(
                  File(_selectedMedia![index].path), // Display each image using its file path
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
