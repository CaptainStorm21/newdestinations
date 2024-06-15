import 'package:flutter/material.dart';
import 'package:newdestinations/reusableItems/reusableButton.dart';

class PreviewCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> linesOfText;
  final VoidCallback exploreAction;
  final VoidCallback addToTripAction;

  const PreviewCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.linesOfText,
    required this.exploreAction,
    required this.addToTripAction,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = constraints.maxWidth * 0.9;
        final double cardHeight = cardWidth * (450 / 700);

        return SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[900]!),
                  ),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: cardWidth,
                          height: cardHeight * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: linesOfText.map((text) => Text(text)).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10), // Additional space
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          child: Text(
                            'Text text where are you text hello world',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildFooter(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableButton(
              text: 'Explore This!',
              color: Colors.blue,
              onPressed: exploreAction,
            ),
            const SizedBox(width: 20), // Add space between buttons
            ReusableButton(
              text: 'Add to Trip',
              color: Colors.orange,
              onPressed: addToTripAction,
            ),
          ],
        ),
      ),
    );
  }
}
