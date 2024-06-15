import 'package:flutter/material.dart';
import 'PreviewCard.dart';

class PreviewCardScreen extends StatelessWidget {
  const PreviewCardScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Card Screen'),
      ),
      body: const Center(
        child: PreviewCard(),
      ),
    );
  }
}