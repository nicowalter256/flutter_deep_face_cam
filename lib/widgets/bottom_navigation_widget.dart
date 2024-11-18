import 'package:flutter/material.dart';
import 'package:flutter_deep_face_cam/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';
import 'custom_button.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  _showBuyerBottomSheet(BuildContext context) {
    final controller = context.read<HomeController>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateSB) {
          return Consumer<HomeController>(
            builder:
                (BuildContext context, HomeController value, Widget? child) {
              return SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        whiteBG,
                        whiteBG,
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            controller.useCases.length,
                            (index) => Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    const Icon(Icons.interests, size: 15),
                                    const SizedBox(width: 20),
                                    Text(
                                      "${controller.useCases[index]['name']}",
                                      style: GoogleFonts.mulish(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 74, 32, 2),
            whiteBG,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.8],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        fixedColor: whiteBG,
        unselectedItemColor: whiteBG,
        onTap: (value) {
          if (value == 2) {
            _showBuyerBottomSheet(context);
          }
          print("anannaananan: $value");
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Deep video',
            icon: Icon(Icons.auto_awesome),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
