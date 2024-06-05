import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                          icon: const Icon(Icons.clear, color: Color.fromARGB(255, 17, 12, 12)),
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
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Add favorite icon functionality here
              },
            ),
            const SizedBox(width: 5),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Add shopping cart icon functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
