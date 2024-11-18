import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchWidget extends StatelessWidget {
  final bool toggler;
  final String title;
  const SwitchWidget({super.key, required this.toggler, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 200, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoSwitch(
            value: toggler,
            onChanged: (value) {
              // setState(() {
              //   _switchValue = !_switchValue;
              // });
            },
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.mulish(
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
