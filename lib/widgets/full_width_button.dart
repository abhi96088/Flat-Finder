import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FullWidthButton extends StatefulWidget {
  const FullWidthButton({super.key,

    required this.text,
    required this.onPressed
  });

  final VoidCallback onPressed;
  final String text;

  @override
  State<FullWidthButton> createState() => _FullWidthButtonState();
}

class _FullWidthButtonState extends State<FullWidthButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(11)))),
          backgroundColor: WidgetStatePropertyAll(AppColors().green),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
        ),
        child: Text(widget.text,style: const TextStyle(fontSize: 18,fontFamily: 'Poppins-Semibold', letterSpacing: 2, shadows: [Shadow(color: Colors.black87, blurRadius: 3, offset: Offset(1.0, 1.0))]),),
      ),
    );
  }
}
