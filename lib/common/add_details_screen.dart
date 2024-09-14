import 'dart:io';

import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/custom_dropdown.dart';
import 'package:flat_finder/widgets/custom_text_field.dart';
import 'package:flat_finder/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({super.key,
  required this.imageFromAddScreen
  });

  final List<XFile>? imageFromAddScreen;

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {

  ///////////////////////=> TEXT EDITING CONTROLLERS <=//////////////////////
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

  // this function shows date picker and handle date selection
  Future<void> _selectDate(BuildContext context) async {
    // shows date picker dialog
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),  // sets the current date by default
      firstDate: DateTime.now(),    // sets the minimum date that can be picked
      lastDate: DateTime(2025),     // sets the maximum date that can be picked
      builder: (context, child) {
        // customize the theme of the date picker
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,  // The date picker widget is passed to the child.
        );
      },
    );
    // if the date is picked and not null, update the text field with the formated date
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);   // formats the date and update the controller
      });
    }
  }

  // selected variable an list of property type
  String selectedPropertyValue = "1 BHK";
  List<String> propertyType = [
    "1 BHK",
    "2 BHK",
    "3 BHK",
    "1 RK",
    "Studio",
    "Room",
    "PG",
  ];

  // selected variable an list of no of bedrooms
  String selectedBedroomsValue = "1";
  List<String> bedrooms = [
    "1",
    "2",
    "3",
  ];

  // selected variable an list of no of bathrooms
  String selectedBathoomsValue = "1";
  List<String> bathrooms = [
    "1",
    "2",
    "3",
  ];

  // selected variable an list of furnishing status
  String selectedFurnishingStatusValue = "Furnished";
  List<String> furnishingStatus = [
    "Furnished",
    "Unfurnished",
    "Semi Furnished",
  ];

  // selected variable an list of who's allowed
  String selectedAllowedValue = "Anyone";
  List<String> allowed = [
    "Bachelors",
    "Girls",
    "Family",
    "Anyone",
  ];

  // selected variable an list of floor no
  String selectedFloorValue = "Ground";
  List<String> floor = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "Ground",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().green,
        title: Text("Include some details", style: TextStyle(color: AppColors().darkGreen, fontSize: 20, fontFamily: "Poppins-Medium"),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // this row contains the image and title field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // below container contains the first selected image by user which will be used as the cover image everywhere
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    clipBehavior: Clip.hardEdge,    // ensure that image respects the border radius
                    child: Image.file(File(widget.imageFromAddScreen![0].path), fit: BoxFit.cover,),
                  ),
                  const Spacer(),
                  // this contains title field
                  SizedBox(
                    width: 220,
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: "Title*"
                      ),
                    ),
                  ),
                  ],
                ),
                const SizedBox(height: 15,),
                // Select property type dropdown
                CustomDropdown(
                    options: propertyType,
                    selectedValue: selectedPropertyValue,
                    label: "Select Type*",
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPropertyValue = newValue!;  // Update selected value
                      });
                    }
                ),
                const SizedBox(height: 10,),
                // select bedrooms dropdown
                CustomDropdown(
                    options: bedrooms,
                    selectedValue: selectedBedroomsValue,
                    label: "Bedrooms*",
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBedroomsValue = newValue!;  // Update selected value
                      });
                    }
                ),
                const SizedBox(height: 10,),
                // select bathrooms dropdown
                CustomDropdown(
                    options: bathrooms,
                    selectedValue: selectedBathoomsValue,
                    label: "Bathrooms*",
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBathoomsValue = newValue!;  // Update selected value
                      });
                    }
                ),
                const SizedBox(height: 10,),
                // select furnishing status dropdown
                CustomDropdown(
                    options: furnishingStatus,
                    selectedValue: selectedFurnishingStatusValue,
                    label: "Furnishing Status*",
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFurnishingStatusValue = newValue!;  // Update selected value
                      });
                    }
                ),
                const SizedBox(height: 10,),
                // select who's allowed dropdown
                CustomDropdown(
                    options: allowed,
                    selectedValue: selectedAllowedValue,
                    label: "Who's Allowed*",
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAllowedValue = newValue!;  // Update selected value
                      });
                    }
                ),
                const SizedBox(height: 10,),
                // select floor no dropdown
                CustomDropdown(
                    options: floor,
                    selectedValue: selectedFloorValue,
                    label: "Floor No*",
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFloorValue = newValue!;  // Update selected value
                      });
                    }
                ),
                const SizedBox(height: 10,),
                // select available from (date picker)
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300], // Background color like previous design
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11), // Rounded corners
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    labelText: 'Available From*',
                    labelStyle: TextStyle(fontSize: 18, color: AppColors().darkGrey),
                    suffixIcon: const Icon(Icons.calendar_month),
                  ),
                  readOnly: true,   // makes the textField non-editable. it only opens the date picker
                  onTap: () => _selectDate(context), // Opens date picker
                ),
                const SizedBox(height: 10,),
                // select rent textField
                CustomTextField(
                  label: "Rent*",
                  textController: rentController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select security money textField
                CustomTextField(
                  label: "Security Money",
                  textController: securityMoneyController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select electricity bill textField
                CustomTextField(
                  label: "Electricity Bill",
                  textController: electricityBillController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select water bill textField
                CustomTextField(
                  label: "Water Bill",
                  textController: waterBillController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select cleaning bill textField
                CustomTextField(
                  label: "Cleaning",
                  textController: cleaningBillController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select address textField
                CustomTextField(
                  label: "Address*",
                  textController: addressController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select other details textField
                CustomTextField(
                  label: "Any Other Details or Restrictions",
                  textController: otherDetailsController,
                  enabledColor: AppColors().darkGrey,
                  labelColor: AppColors().darkGrey,
                  labelSize: 18,
                ),
                const SizedBox(height: 10,),
                // select description textField
                Container(
                  height: 100,
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    minLines: 1,
                    maxLines: 10,
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),

                  ),
                ),
                FullWidthButton(
                    text: "Post Now",
                    onPressed: (){}   // post all data in database and show user that your property is listed successfully and then reflect it on their profile
                ),
                const SizedBox(height: 10,),
          
              ],
            ),
          ),
        ),
      )
    );
  }
}
