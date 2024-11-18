import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: whiteBG,
      appBar: const AppBarWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: double.infinity,
          ),
          Positioned(
            top: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: size.height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height / 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    orangeBG,
                    whiteBG,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topRight,
                  stops: [0.0, 0.8],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 170,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              profile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 170,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              profile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.height / 5,
                    decoration: const BoxDecoration(
                      color: whiteBG,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Deep video")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
