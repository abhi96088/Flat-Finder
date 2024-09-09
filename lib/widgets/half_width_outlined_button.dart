import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HalfWidthOutlinedButton extends StatefulWidget {
  const HalfWidthOutlinedButton({super.key,

  required this.text,
  required this.iconPath,
  required this.onPressed,
  });

  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  @override
  State<HalfWidthOutlinedButton> createState() => _HalfWidthOutlinedButtonState();
}

class _HalfWidthOutlinedButtonState extends State<HalfWidthOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: (){},
        style: const ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(11))))
        ),
        child: SizedBox(
          width: 100,
          height: 52,
          child: Row(
            children: [
              SvgPicture.asset(widget.iconPath, width: 25,height: 25,),
              const SizedBox(width: 10,),
              Text(widget.text)
            ],
          ),
        )
    );
  }
}
