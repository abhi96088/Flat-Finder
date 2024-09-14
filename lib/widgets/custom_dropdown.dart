import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.label,
    required this.onChanged,
  });

  // parameters to be taken
  final List<String> options;
  final String selectedValue;
  final String label;
  final ValueChanged<String?> onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue,  // selected value pass by parameter
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide.none
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelText: widget.label,
        labelStyle: TextStyle(fontSize: 18, color: AppColors().darkGrey),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      style: const TextStyle(fontSize: 16), // font size of text inside dropdown
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
