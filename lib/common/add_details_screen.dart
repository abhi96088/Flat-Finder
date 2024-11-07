import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flat_finder/tenant/bottom_navigation_tenant.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/custom_dropdown.dart';
import 'package:flat_finder/widgets/custom_text_field.dart';
import 'package:flat_finder/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart'; // To generate unique file names

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({super.key, required this.imageFromAddScreen});

  final List<XFile>? imageFromAddScreen;

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  // Text editing controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController securityMoneyController = TextEditingController();
  final TextEditingController electricityBillController = TextEditingController();
  final TextEditingController waterBillController = TextEditingController();
  final TextEditingController cleaningBillController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController otherDetailsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Function to select date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  // Dropdown options and selected values
  String selectedPropertyValue = "1 BHK";
  List<String> propertyType = [
    "1 BHK",
    "2 BHK",
    "3 BHK",
    "1 RK",
    "Studio",
    "Room",
    "PG",
    "Flat/Room mate"
  ];
  String selectedBedroomsValue = "1";
  List<String> bedrooms = ["1", "2", "3"];
  String selectedBathoomsValue = "1";
  List<String> bathrooms = ["1", "2", "3"];
  String selectedFurnishingStatusValue = "Furnished";
  List<String> furnishingStatus = [
    "Furnished",
    "Unfurnished",
    "Semi Furnished"
  ];
  String selectedAllowedValue = "Anyone";
  List<String> allowed = ["Bachelors", "Girls", "Family", "Anyone"];
  String selectedFloorValue = "Ground";
  List<String> floor = ["1", "2", "3", "4", "5", "Ground"];

  // Function to upload images to Firebase Storage
  Future<List<String>> _uploadImages(List<XFile> images) async {
    List<String> imageUrls = [];
    // Generate a unique ID for the property document
    final FirebaseStorage storage = FirebaseStorage.instance;
    for (XFile image in images) {
      String fileName = Uuid().v4(); // Generate a unique file name
      Reference ref = storage.ref().child('property_images').child(fileName);
      try {
        await ref.putFile(File(image.path));
        String downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
    return imageUrls;
  }

  // Function to post property details
  Future<void> _postDetails() async {
    // Collect form data
    String title = titleController.text;
    String rent = rentController.text;
    String securityMoney = securityMoneyController.text;
    String electricityBill = electricityBillController.text;
    String waterBill = waterBillController.text;
    String cleaningBill = cleaningBillController.text;
    String address = addressController.text;
    String otherDetails = otherDetailsController.text;
    String description = descriptionController.text;
    String availableFrom = _dateController.text;

    // Validate form data
    if (title.isEmpty ||
        rent.isEmpty ||
        securityMoney.isEmpty ||
        address.isEmpty ||
        description.isEmpty ||
        availableFrom.isEmpty ||
        widget.imageFromAddScreen == null ||
        widget.imageFromAddScreen!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the details") ,
        ),

      );

      return;
    }

    // Get current user's UID
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Upload images and get their URLs
    List<String> imageUrls = await _uploadImages(widget.imageFromAddScreen!);
    String propertyId = FirebaseFirestore.instance.collection('properties').doc().id;


    // Prepare property details
    Map<String, dynamic> propertyDetails = {
      'propertyId': propertyId,
      'title': title,
      'rent': rent,
      'securityMoney': securityMoney,
      'electricityBill': electricityBill,
      'waterBill': waterBill,
      'cleaningBill': cleaningBill,
      'address': address,
      'otherDetails': otherDetails,
      'description': description,
      'availableFrom': availableFrom,
      'propertyType': selectedPropertyValue,
      'bedrooms': selectedBedroomsValue,
      'bathrooms': selectedBathoomsValue,
      'furnishingStatus': selectedFurnishingStatusValue,
      'allowed': selectedAllowedValue,
      'floor': selectedFloorValue,
      'imageUrls': imageUrls,
      'userId': uid,
      'timestamp': FieldValue.serverTimestamp(),
    };

    // Store property details in FireStore
    try {
      await FirebaseFirestore.instance
          .collection('properties')
          .add(propertyDetails);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Property details posted successfully')),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationTenant(selectedIndex: 4,))) ;
    } catch (e) {
      print("Error posting details: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to post property details')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "Include some details",
          style: TextStyle(
              color: AppColors().darkGreen,
              fontSize: 20,
              fontFamily: "Poppins-Medium"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.file(
                          File(widget.imageFromAddScreen![0].path),
                          fit: BoxFit.cover),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 220,
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: "Title*",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomDropdown(
                  options: propertyType,
                  selectedValue: selectedPropertyValue,
                  label: "Select Type*",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPropertyValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                /// bedRoom
                CustomDropdown(
                  options: bedrooms,
                  selectedValue: selectedBedroomsValue,
                  label: "Bedrooms*",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBedroomsValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                /// bathroom
                CustomDropdown(
                  options: bathrooms,
                  selectedValue: selectedBathoomsValue,
                  label: "Bathrooms*",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBathoomsValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                /// Furnishing Status
                CustomDropdown(
                  options: furnishingStatus,
                  selectedValue: selectedFurnishingStatusValue,
                  label: "Furnishing Status*",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFurnishingStatusValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                /// Allowed
                CustomDropdown(
                  options: allowed,
                  selectedValue: selectedAllowedValue,
                  label: "Who's Allowed*",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAllowedValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                /// floors
                CustomDropdown(
                  options: floor,
                  selectedValue: selectedFloorValue,
                  label: "Floor*",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFloorValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                /// date picker
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        hintText: "Available From",
                        filled: true,
                        fillColor:Colors.grey.shade300,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                /// rent
                CustomTextField(
                  textController: rentController,
                  label: "Rent",
                ),
                const SizedBox(
                  height: 10,
                ),

                /// security Money
                CustomTextField(
                  textController: securityMoneyController,
                  label: "Security Money",
                ),
                const SizedBox(
                  height: 10,
                ),

                /// Electricity Bill
                CustomTextField(
                  textController: electricityBillController,
                  label: "Electricity Bill",
                ),
                const SizedBox(
                  height: 10,
                ),

                /// water bill
                CustomTextField(
                  textController: waterBillController,
                  label: "Water Bill",
                ),
                const SizedBox(
                  height: 10,
                ),

                /// cleaning bill
                CustomTextField(
                  textController: cleaningBillController,
                  label: "Cleaning Bill",
                ),
                const SizedBox(
                  height: 10,
                ),

                /// Address
                CustomTextField(
                  textController: addressController,
                  label: "Address*",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textController: otherDetailsController,
                  label: "Other Details",
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descriptionController,
                  minLines: 2,
                  maxLines: 10,
                  decoration: const InputDecoration(hintText: "Description*"),
                ),

                const SizedBox(height: 15),

                /// post button ---------------------------------------
                FullWidthButton(
                  onPressed: _postDetails,
                  text: 'Post Details',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
