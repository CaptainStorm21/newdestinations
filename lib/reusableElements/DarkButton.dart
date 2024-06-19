import 'package:flutter/material.dart';

class DarkButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DarkButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color(0xFFFAF3EF),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF0D0703),
            letterSpacing: 3.0,
          ),
        ),
      ),
    );
  }
}
