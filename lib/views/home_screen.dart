import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/switch_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  bool isPickingImage = false;
  final _picker = ImagePicker();

  bool _switchValue = false;

  Future<void> pickImage(ImageSource imageSource) async {
    setState(() {
      isPickingImage = true;
    });
    await _picker.pickImage(source: imageSource).then((selectedImageFile) {
      setState(() {
        image = File(selectedImageFile!.path);
        isPickingImage = false;
      });
    });
  }

  ImagePicker imagePicker = ImagePicker();
  List<XFile> images = [];
  void pickImageFromDevice() async {
    var image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        images.add(image);
      });
    }
  }

  doPickImage(String source) async {
    if (source == "camera") {
      var image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          images.add(image);
        });
      }
    } else {
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          images.add(image);
        });
      }
    }

    setState(() {});
  }

  void showBottomSheetPhoto(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        doPickImage('camera');
                      },
                      dense: false,
                      leading: const Icon(Icons.camera_alt, color: blackBG),
                      title: const Text(
                        "Camera",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      dense: false,
                      onTap: () => {doPickImage("gallery")},
                      leading:
                          const Icon(Icons.photo_library_sharp, color: blackBG),
                      title: const Text(
                        "Gallery",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: whiteBG,
      appBar: const AppBarWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: size.height / 4,
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
          const SizedBox(height: 20),
          Expanded(
            child: Container(
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
                        GestureDetector(
                          onTap: () => {
                            showBottomSheetPhoto(context),
                          },
                          child: SizedBox(
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
                  const SizedBox(height: 50),
                  const SwitchWidget(
                    title: "keep fps",
                    toggler: true,
                  ),
                  const SwitchWidget(
                    title: "keep frames",
                    toggler: true,
                  ),
                  const SwitchWidget(
                    title: "keep audio",
                    toggler: false,
                  ),
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
