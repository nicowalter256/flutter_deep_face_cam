import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(color: blueBG),
      ),
      title: Text(
        "Deep Face preview",
        style: GoogleFonts.mulish(
          textStyle:
              const TextStyle(color: whiteBG, fontWeight: FontWeight.bold),
        ),
      ),
      centerTitle: true,
      actions: [
        const SizedBox(width: 20),
        Container(
          height: 40,
          width: 40,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: whiteBG),
          child: const Center(
            child: Icon(Icons.camera_alt_outlined),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(200, 60);
}
