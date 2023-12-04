import 'package:flutter/material.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color bgColor;

  const CommonButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.bgColor =  green, // Default color is green
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        foregroundColor: MaterialStateProperty.all(white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: child,
    );
  }
}
