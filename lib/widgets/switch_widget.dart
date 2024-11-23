import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SwitchWidget extends StatefulWidget {
  bool toggler;
  final String title;
  SwitchWidget({super.key, required this.toggler, required this.title});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 200, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoSwitch(
            value: widget.toggler,
            onChanged: (value) {
              setState(() {
                widget.toggler = !widget.toggler;
              });
            },
          ),
          const SizedBox(width: 10),
          Text(
            widget.title,
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
