import 'package:calculator/responsive.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final bool isEqualsButton;
  const CustomButton({
    required this.onTap,
    required this.buttonText,
    this.isEqualsButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.07;
    double fontSize = MediaQuery.of(context).size.width * 0.032;

    if (Responsive.isMediumScreen(context)) {
      buttonWidth = MediaQuery.of(context).size.width * 0.10;
      fontSize = MediaQuery.of(context).size.width *
          0.041; // Adjust font size for medium screens
    } else if (Responsive.isSmallScreen(context)) {
      buttonWidth = MediaQuery.of(context).size.width * 0.17;
      fontSize = MediaQuery.of(context).size.width *
          0.042; // Adjust font size for small screens
    }

    return SizedBox(
      width: buttonWidth,
      height: buttonWidth,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: isEqualsButton ? const StadiumBorder() : const CircleBorder(),
          backgroundColor: isEqualsButton
              ? const Color.fromARGB(255, 241, 141, 185)
              : Colors.white,
          elevation: 8,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
