import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final MaterialStateProperty<Color?>? color;
  const ElevatedBtn(
      {Key? key, required this.onPressed, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      ),
    );
  }
}
