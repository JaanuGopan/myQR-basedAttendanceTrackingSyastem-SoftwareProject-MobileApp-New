import 'package:flutter/material.dart';

class MyButtonSmall extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double width;

  const MyButtonSmall({
    Key? key,
    required this.onTap,
    required this.text, required this.width,
  }) : super(key: key);

  @override
  _MyButtonSmallState createState() => _MyButtonSmallState();
}

class _MyButtonSmallState extends State<MyButtonSmall> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isButtonPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isButtonPressed = false;
        });
        widget.onTap?.call();
      },
      onTapCancel: () {
        setState(() {
          _isButtonPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: _isButtonPressed ? Colors.white : Color(0xFF086494),
          border: Border.all(
            color: Color(0xFF086494),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isButtonPressed ? Color(0xFF086494) : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
