import 'package:flutter/material.dart';

class LoginSignupSmallButton extends StatefulWidget {
  const LoginSignupSmallButton({super.key,

    required this.text,
    required this.onPressed
  });

  final String text;
  final VoidCallback onPressed;


  @override
  State<LoginSignupSmallButton> createState() => _LoginSignupSmallButtonState();
}

class _LoginSignupSmallButtonState extends State<LoginSignupSmallButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ButtonStyle(
            fixedSize: const WidgetStatePropertyAll(Size(97,37)),
            backgroundColor: WidgetStatePropertyAll(Colors.white.withOpacity(0.4)),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                )
            ),
          ),

          onPressed: widget.onPressed,
          child: Text(widget.text)
      );
  }
}
