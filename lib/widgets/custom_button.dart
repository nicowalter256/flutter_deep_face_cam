import 'package:flutter/material.dart';
import 'package:flutter_deep_face_cam/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final IconData? icon;
  final VoidCallback onPress;
  final Color btnColor, textColor;
  const CustomButton(
      {super.key,
      required this.onPress,
      required this.name,
      required this.btnColor,
      required this.textColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          backgroundColor: btnColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: icon == null
            ? Center(
                child: Text(
                  name,
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: blackBG),
                  const SizedBox(width: 10),
                  Text(
                    name,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
