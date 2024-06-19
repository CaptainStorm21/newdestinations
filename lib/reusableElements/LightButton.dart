import 'package:flutter/material.dart';

class LightButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LightButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF0d0703), backgroundColor: const Color(0xFFFaf3ef), // Text color #0d0703
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Round corners set to 0
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding
        textStyle: const TextStyle(
          letterSpacing: 3, // Letter spacing
          fontWeight: FontWeight.bold, // Bold text
        ),
      ),
      child: Text(
        label.toUpperCase(), // Uppercase text
      ),
    );
  }
}
