import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {

  const HeartButton({
    super.key,
    required this.productID,
    this.size,
    this.colorDisable = Colors.black,
    this.enabledColor = const Color.fromARGB(255, 189, 10, 10),
  });

  final String productID;
  final double? size;
  final Color? colorDisable;
  final Color? enabledColor;

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        CupertinoIcons.heart,
        size: widget.size,
        color: widget.enabledColor
      ),
    );
  }
}