import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                whiteBG,
                orangeBG,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 5.0],
              tileMode: TileMode.clamp),
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
              color: whiteBG,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.video_camera_front),
              SizedBox(width: 10),
              Text("My Videos")
            ],
          ),
        ),
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
