import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newdestinations/modals/filterModal/FilterModalState.dart';

class SearchbarDestination extends StatefulWidget {
  const SearchbarDestination({super.key});

  @override
  _SearchbarDestinationState createState() => _SearchbarDestinationState();
}

class _SearchbarDestinationState extends State<SearchbarDestination> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Explore destinations!',
                  hintText: 'Please enter your destination.',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear,
                              color: Color.fromARGB(255, 17, 12, 12)),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              icon: const Icon(Icons.tune_outlined),
              onPressed: () {
                context.read<FilterModalCubit>().openModal();
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                // Add favorite icon functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
