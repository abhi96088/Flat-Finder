import 'package:flat_finder/theme/colors.dart';
import 'package:flat_finder/widgets/custom_text_field.dart';
import 'package:flat_finder/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  // controllers for all the details
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // taking string variable to store the gender value
  String? selectedGender;

  // Function to show the date picker and set the selected date in the text field
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default starting date
      firstDate: DateTime(1970),   // The earliest allowable date
      lastDate: DateTime.now(), // The latest allowable date
      builder: (BuildContext context, Widget? child){
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors().blue,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors().blue,
                  foregroundColor: Colors.white
                )
              )
            ),
            child: child!
        );
      }
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked); // Format and display date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().green,
        title: Text("Edit Your Profile Details", style: TextStyle(color: AppColors().darkGreen, fontSize: 22, fontFamily: "Poppins-Medium"),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(height: 20,),
              /// name field
              CustomTextField(
                  label: "Name",
                  textController: nameController
              ),
            const SizedBox(height: 20,),
            /// email field
            CustomTextField(
                label: "Email",
                textController: emailController
            ),
            const SizedBox(height: 20,),
            /// phone number field
            CustomTextField(
                label: "Phone Number",
                textController: numberController
            ),
            const SizedBox(height: 20,),
            /// phone number field
            CustomTextField(
                label: "Profession",
                textController: professionController
            ),
            const SizedBox(height: 20,),
            /// date picker
            TextFormField(
              onTap: () => _selectDate(context),
              controller: _dateController,
              readOnly: true, // Prevent typing into the text field
              decoration: InputDecoration(
              label: const Text("Date of Birth"),
              labelStyle: const TextStyle(fontSize: 18),
              filled: true,
              fillColor: Colors.grey.shade300,
              border: OutlineInputBorder(
              borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(11)
              ),
              suffixIcon: const Icon(Icons.calendar_month),
            )
            ),
            const SizedBox(height: 20,),
            /// gender title only
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Gender", style: TextStyle(fontSize: 18),),
            ),
            // row containing all three radio buttons of gender option
            Row(
              children: [
                Radio(
                    activeColor: AppColors().blue,
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged:(value){
                      setState(() {
                        selectedGender = value;
                      });
                    }
                ),
                const Text("Male"),
                const Spacer(),
                Radio(
                    activeColor: AppColors().blue,
                    value: "Female",
                    groupValue: selectedGender,
                    onChanged:(value){
                      setState(() {
                        selectedGender = value;
                      });
                    }
                ),
                const Text("Female"),
                const Spacer(),
                Radio(
                    activeColor: AppColors().blue,
                    value: "Other",
                    groupValue: selectedGender,
                    onChanged:(value){
                      setState(() {
                        selectedGender = value;
                      });
                    }
                ),
                const Text("Other"),
                const Spacer()
              ],
            ),
            const SizedBox(height: 100,),
            /// save button
            Center(
              child: FullWidthButton(
                  text: "Save",
                  onPressed: (){

                    /// -------------------------*******************************-------------------------------- ///
                    /// Update details in database and then redirect to profile screen and reflect changes there ///
                    /// -------------------------*******************************-------------------------------- ///

                  }
              ),
            )

          ],
        ),
      ),
    );
  }
}
