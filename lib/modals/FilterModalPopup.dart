import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newdestinations/modals/filterModal/FilterModalState.dart';

// Example data from filterSearch.json (you can replace this with your actual data)
Map<String, List<String>> filterSearchJson = {
  "Traveler Type": [
    "Families with Kids",
    "Couples/Adults without Kids",
    // Add other traveler types
  ],
  "Distance": [
    "Local Trips",
    "Short-Distance Trips",
    // Add other distance options
  ],
  // Add other categories
};

class FilterModalPopup extends StatelessWidget {
  final Function(List<String>) onSubmit;

  const FilterModalPopup({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterModalCubit, FilterModalState>(
      builder: (context, state) {
        return state == FilterModalState.closed
            ? const SizedBox.shrink()
            : Scaffold(
                backgroundColor: Colors.black.withOpacity(0.6),
                body: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Filter Results',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  context.read<FilterModalCubit>().closeModal();
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: filterSearchJson.length,
                              itemBuilder: (context, index) {
                                String category =
                                    filterSearchJson.keys.toList()[index];
                                List<String> options =
                                    filterSearchJson[category] ?? [];

                                return ExpansionTile(
                                  title: Text(category),
                                  children: options
                                      .map((option) => CheckboxListTile(
                                            title: Text(option),
                                            value: false, // Replace with actual value
                                            onChanged: (value) {
                                              // Handle checkbox state change
                                            },
                                          ))
                                      .toList(),
                                );
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Placeholder for submit functionality
                              List<String> selectedFilters = [];

                              // Example: Collect selected filters
                              for (var options in filterSearchJson.values) {
                                // ignore: unused_local_variable
                                for (var option in options) {
                                  // Check if option is selected (based on your implementation)
                                  // Example: if (option.isSelected) selectedFilters.add(option);
                                }
                              }

                              // Call onSubmit with selected filters
                              onSubmit(selectedFilters);

                              // Close the modal
                              context.read<FilterModalCubit>().closeModal();
                            },
                            child: const Text('Results Found'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

