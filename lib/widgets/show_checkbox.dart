import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class ShowCheckbox extends StatefulWidget {
  ShowCheckbox({super.key,

  required this.value,
  required this.text,
    this.icon = ""

  });

  late bool value;
  final String text;
  final String icon;

  @override
  State<ShowCheckbox> createState() => _ShowCheckboxState();
}

class _ShowCheckboxState extends State<ShowCheckbox> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: Checkbox(
              activeColor: AppColors().blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), ),
              value: widget.value,
              onChanged: (newValue){
                setState(() {
                  widget.value = newValue!;
                });
              }
          ),
        ),
        Text(widget.text, style: TextStyle(color: AppColors().darkGreen, fontFamily: "Poppins-Medium", fontSize: 16),),
        SvgPicture.asset(widget.icon!, width: 25, height: 25,)
      ],
    );
  }
}
