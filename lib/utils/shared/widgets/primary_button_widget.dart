import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const PrimaryButtonWidget(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: text == ''
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
        ),
      ),
    );
  }
}
