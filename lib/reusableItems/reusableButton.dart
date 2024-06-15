import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const ReusableButton({
    required this.text,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3), // Rounded edges
        ),
      ),
      child: Text(text),
    );
  }
}
