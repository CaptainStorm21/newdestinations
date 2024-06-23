import 'package:flutter/material.dart';

class BuyIt extends StatelessWidget {
  final List<Map<String, dynamic>> basket;

  const BuyIt({super.key, required this.basket});

  @override
  Widget build(BuildContext context) {
    double total = basket.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy It'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: basket.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(basket[index]['name']),
                  subtitle: Text('Quantity: ${basket[index]['quantity']} Size: ${basket[index]['size'] ?? 'N/A'}'),
                  trailing: Text('\$${(basket[index]['price'] * basket[index]['quantity']).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () {
              // Handle the checkout process
            },
            child: const Text('Complete Purchase'),
          ),
        ],
      ),
    );
  }
}
