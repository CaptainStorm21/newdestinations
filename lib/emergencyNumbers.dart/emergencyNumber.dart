import 'package:flutter/material.dart';

class EmergencyNumber extends StatelessWidget {
  final Map<String, dynamic> data;

  const EmergencyNumber({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Emergency Numbers:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        if (data != null)
          ...data['emergency_numbers'].entries.map((entry) {
            if (entry.value.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('${entry.key}: ${entry.value}'),
              );
            } else {
              return const SizedBox.shrink();
            }
          }).toList(),
        const SizedBox(height: 10),
        const Text(
          'Non-Emergency Numbers:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        if (data != null)
          ...data['non_emergency_numbers'].entries.map((entry) {
            if (entry.value.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('${entry.key}: ${entry.value}'),
              );
            } else {
              return const SizedBox.shrink();
            }
          }).toList(),
      ],
    );
  }
}