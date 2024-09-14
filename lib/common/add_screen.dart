import 'dart:io';

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
  final ImagePicker _picker =
      ImagePicker(); // object to manage media picking from camera or gallery
  List<XFile>? _selectedMedia = []; // list to store selected images

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pickImages(); // Open media picker as soon as the screen loads
    });
  }

  // method to pick multiple images from the gallery
  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage(); // Pick multiple images
    // If images are selected, update the state and store them in _selectedMedia
    if (images != null) {
      setState(() {
        _selectedMedia = images;
      });
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDetailsScreen(imageFromAddScreen: _selectedMedia,)),
              );
            },
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
                // camera button
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () async {
                    final XFile? image = await _picker.pickImage(
                        source: ImageSource
                            .camera); // Capture an image using the camera
                    if (image != null) {
                      // Add the captured image to the _selectedMedia list
                      setState(() {
                        _selectedMedia!.add(image);
                      });
                    }
                  },
                ),
                // gallery button
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed:
                      pickImages, // Opens the gallery to pick multiple images
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
              itemCount: _selectedMedia!.length, // number of images in the list
              itemBuilder: (context, index) {
                return Image.file(
                  File(_selectedMedia![index]
                      .path), // display each image using it's file path
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
