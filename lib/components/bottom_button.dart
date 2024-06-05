import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Color color;
  final void Function()? onPressed;
  const BottomButton(
      {super.key,
      required this.buttonTitle,
      required this.color,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
        color: color,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
