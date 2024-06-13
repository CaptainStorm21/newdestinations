import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_cubit.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: FilterModal(),
    );
  }
}

class FilterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          AppBar(
            title: Text('Filters'),
            actions: [
              TextButton(
                onPressed: () {
                  // Clear all filters
                },
                child: Text('Clear all'),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                _buildAccordionSection(
                  context: context,
                  title: 'Sorting by',
                  children: [
                    _buildRadioButton(context, 'Distance'),
                    _buildRadioButton(context, 'Newest'),
                    _buildRadioButton(context, 'Rating'),
                  ],
                ),
                _buildAccordionSection(
                  context: context,
                  title: 'Budget',
                  children: [
                    _buildCheckbox(context, '\$'),
                    _buildCheckbox(context, '\$\$'),
                    _buildCheckbox(context, '\$\$\$'),
                    _buildCheckbox(context, '\$\$\$\$'),
                    _buildCheckbox(context, '\$\$\$\$\$'),
                  ],
                ),
                _buildAccordionSection(
                  context: context,
                  title: 'Number of Tours Available',
                  children: [
                    _buildCheckbox(context, 'from 1 to 10'),
                    _buildCheckbox(context, 'from 11 to 20'),
                    _buildCheckbox(context, 'from 21 - 30'),
                  ],
                ),
                _buildAccordionSection(
                  context: context,
                  title: 'Rating',
                  children: [
                    _buildCheckbox(context, '★☆☆☆☆'),
                    _buildCheckbox(context, '★★☆☆☆'),
                    _buildCheckbox(context, '★★★☆☆'),
                    _buildCheckbox(context, '★★★★☆'),
                    _buildCheckbox(context, '★★★★★'),
                  ],
                ),
                _buildAccordionSection(
                  context: context,
                  title: 'Experience',
                  children: [
                    _buildCheckbox(context, 'Family & Kids Activities'),
                    _buildCheckbox(context, 'Adventure Sports & Thrills'),
                    _buildCheckbox(context, 'Shopping & Markets'),
                    _buildCheckbox(context, 'Educational & Workshops'),
                    _buildCheckbox(context, 'Nature & Wildlife'),
                    _buildCheckbox(context, 'Entertainment & Events'),
                    _buildCheckbox(context, 'Wellness & Relaxation'),
                    _buildCheckbox(context, 'Cultural & Historical Experiences'),
                  ],
                ),
                _buildAccordionSection(
                  context: context,
                  title: 'Cuisine',
                  children: [
                    _buildCheckbox(context, 'Italian'),
                    _buildCheckbox(context, 'Chinese'),
                    _buildCheckbox(context, 'Japanese'),
                    _buildCheckbox(context, 'Indian'),
                    _buildCheckbox(context, 'Mexican'),
                    _buildCheckbox(context, 'American'),
                    _buildCheckbox(context, 'French'),
                    _buildCheckbox(context, 'Thai'),
                    _buildCheckbox(context, 'Spanish'),
                    _buildCheckbox(context, 'Greek'),
                    _buildCheckbox(context, 'Vietnamese'),
                    _buildCheckbox(context, 'Turkish'),
                    _buildCheckbox(context, 'Lebanese'),
                    _buildCheckbox(context, 'Korean'),
                    _buildCheckbox(context, 'Brazilian'),
                    _buildCheckbox(context, 'Ethiopian'),
                    _buildCheckbox(context, 'German'),
                    _buildCheckbox(context, 'British'),
                    _buildCheckbox(context, 'Caribbean'),
                    _buildCheckbox(context, 'Moroccan'),
                    _buildCheckbox(context, 'Russian'),
                    _buildCheckbox(context, 'Argentinian'),
                    _buildCheckbox(context, 'Peruvian'),
                    _buildCheckbox(context, 'Malaysian'),
                    _buildCheckbox(context, 'Filipino'),
                    _buildCheckbox(context, 'Indonesian'),
                    _buildCheckbox(context, 'Cuban'),
                    _buildCheckbox(context, 'Portuguese'),
                    _buildCheckbox(context, 'Swiss'),
                    _buildCheckbox(context, 'Middle Eastern'),
                    _buildCheckbox(context, 'Bakery'),
                    _buildCheckbox(context, 'Cafe'),
                    _buildCheckbox(context, 'Vegan'),
                    _buildCheckbox(context, 'Vegetarian'),
                    _buildCheckbox(context, 'Farm-To-Table / Locally Grown'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('View 323 Results'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccordionSection({required BuildContext context, required String title, required List<Widget> children}) {
    return ExpansionTile(
      title: Text(title),
      children: children,
    );
  }

  Widget _buildRadioButton(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      trailing: Radio(
        value: title,
        groupValue: null, // Update this according to your state management
        onChanged: (value) {
          // Handle change
        },
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context, String title) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return ListTile(
          title: Text(title),
          trailing: Checkbox(
            value: state.budgets[title] ?? false, // Ensure value is not null
            onChanged: (value) {
              context.read<FilterCubit>().toggleBudget(title);
            },
          ),
        );
      },
    );
  }
}
