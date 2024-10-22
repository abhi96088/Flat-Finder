import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/colors.dart';
import 'custom_text_field.dart';
import 'full_width_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? selectedGender;
  File? _profileImage;
  final picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Variable to hold the profile image URL
  String? _profileImageUrl;

  // Loading state variable
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user!.uid).get();

      if (userDoc.exists) {
        // Ensure null safety for each field
        setState(() {
          nameController.text = userDoc.get('name') ?? '';
          emailController.text = userDoc.get('email') ?? '';
          numberController.text =
              userDoc.get('phone') ?? ''; // Checking for phone
          professionController.text =
              userDoc.get('profession') ?? ''; // Checking for profession
          _dateController.text = userDoc.get('dob') ?? ''; // Checking for dob
          selectedGender = userDoc.get('gender') ?? ''; // Checking for gender

          /// ----------- Check if profileImageUrl exists and set profile image
          if (userDoc.get('profileImageUrl') != null) {
            _profileImageUrl = userDoc.get('profileImageUrl');
          }
        });
      }
    }
  }

  Future<void> _updateUserProfile() async {
    if (user != null) {
      setState(() {
        isLoading = true; // Start loading
      });

      Map<String, dynamic> updatedData = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': numberController.text,
        'profession': professionController.text,
        'dob': _dateController.text,
        'gender': selectedGender,
      };

      if (_profileImage != null) {
        String imageUrl = await _uploadProfileImage();
        updatedData['profileImageUrl'] = imageUrl;
      }

      await _firestore.collection('users').doc(user!.uid).update(updatedData);

      setState(() {
        isLoading = false; // Stop loading
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')));
      Navigator.pop(
          context); // Optionally, navigate back to the previous screen
    }
  }

  Future<String> _uploadProfileImage() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_profile_images/${user!.uid}.jpg');

    await storageRef.putFile(_profileImage!);
    return await storageRef.getDownloadURL();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().green,
        title: const Text(
          "Edit Your Profile Details",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontFamily: "Poppins-Medium"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  // Profile picture display
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipOval(
                      child: _profileImage != null
                          ? Image.file(
                              _profileImage!,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            )
                          : (_profileImageUrl != null
                              ? Image.network(
                                  _profileImageUrl!,
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                )
                              : Image.asset(
                                  "assets/icons/user (2).png",
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                )),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 90,
                    child: CircleAvatar(
                      minRadius: 10,
                      child: IconButton(
                          onPressed: _pickImage,
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),

              /// name field
              CustomTextField(label: "Name", textController: nameController),
              const SizedBox(height: 20),

              /// email field
              CustomTextField(label: "Email", textController: emailController),
              const SizedBox(height: 20),

              /// phone number field
              CustomTextField(
                  label: "Phone Number", textController: numberController),
              const SizedBox(height: 20),

              /// profession field
              CustomTextField(
                  label: "Profession", textController: professionController),
              const SizedBox(height: 20),

              // DOB field (with date picker)
              TextFormField(
                onTap: () => _selectDate(context),
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  label: const Text("Date of Birth"),
                  labelStyle: const TextStyle(fontSize: 18),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(11)),
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
              ),
              const SizedBox(height: 10),

              /// gender title only
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              // row containing all three radio buttons of gender option
              Row(
                children: [
                  Radio(
                      activeColor: AppColors().blue,
                      value: "Male",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      }),
                  const Text("Male"),
                  Radio(
                      activeColor: AppColors().blue,
                      value: "Female",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      }),
                  const Text("Female"),
                  const Spacer(),
                  Radio(
                      activeColor: AppColors().blue,
                      value: "Other",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      }),
                  const Text("Other"),
                  const Spacer()
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// cancel button
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          side: const BorderSide(width: 2, color: Colors.red),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins-Semibold",
                                color: Colors.red),
                          ),
                        )),
                  ),

                  SizedBox(
                    width: 150,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : FullWidthButton(
                      /// -------------------------*******************************-------------------------------- ///
                      /// Update details in database and then redirect to profile screen and reflect changes there ///
                      /// -------------------------*******************************-------------------------------- ///
                            onPressed: _updateUserProfile,
                            text: 'Save',
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
