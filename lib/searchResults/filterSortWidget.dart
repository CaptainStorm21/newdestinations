import 'package:flutter/material.dart';

class FilterSortWidget extends StatefulWidget {
  const FilterSortWidget({super.key});

  @override
  _FilterSortWidgetState createState() => _FilterSortWidgetState();
}

class _FilterSortWidgetState extends State<FilterSortWidget> {
  String _sortBy = 'Relevance';
  final Map<String, bool> _ageRange = {
    'Toddlers': false,
    'Preschool': false,
    'Schoolers': false,
    'Teenagers': false,
    '65+': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Filter & Sort')),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _sortBy = 'Relevance';
                _ageRange.updateAll((key, value) => false);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            buildAccordionSection(
              'Sort: Relevance',
              Column(
                children: [
                  buildRadioButton('Relevance'),
                  buildRadioButton('Bestselling'),
                  buildRadioButton('Top-Rated'),
                  buildRadioButton('Price: High to Low'),
                  buildRadioButton('Price: Low to High'),
                  buildRadioButton('New'),
                ],
              ),
            ),
            buildAccordionSection(
              'Interest',
              const Text('Interest content goes here'),
            ),
            buildAccordionSection(
              'Rating',
              const Text('Rating content goes here'),
            ),
            buildAccordionSection(
              'Age Range',
              Column(
                children: _ageRange.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: _ageRange[key],
                    onChanged: (bool? value) {
                      setState(() {
                        _ageRange[key] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccordionSection(String title, Widget content) {
    return ExpansionTile(
      title: Text(title),
      children: [content],
    );
  }

  Widget buildRadioButton(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: _sortBy,
      onChanged: (String? value) {
        setState(() {
          _sortBy = value!;
        });
      },
    );
  }
}
