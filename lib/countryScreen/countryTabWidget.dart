import 'dart:convert';
import 'package:flutter/material.dart';

class CountryTabWidget extends StatelessWidget {
  final List<Map<String, String>> tabs;

  const CountryTabWidget({Key? key, required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var tab in tabs)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    // Handle tab selection
                  },
                  child: Text(tab['tab_name']!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}