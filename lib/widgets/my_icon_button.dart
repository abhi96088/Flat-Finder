import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';

/// Created by -> Rahul kumar
class MyIconButton extends StatelessWidget {
  final IconData mIcon;
  final VoidCallback onPress;
  const MyIconButton({super.key, required this.mIcon, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: AppColors().blue50),
        onPressed: onPress,
        icon: Icon(mIcon));
  }
}
