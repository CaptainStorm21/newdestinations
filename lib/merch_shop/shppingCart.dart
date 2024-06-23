import 'package:flutter/material.dart';
import 'buyIt.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Map<String, dynamic>> basket = [];

  void addToBasket(Map<String, dynamic> item) {
    setState(() {
      basket.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView(
        children: <Widget>[
          _buildItem(
            'assets/sweatshirt.jpg',
            'Sweatshirt',
            19.99,
            true,
          ),
          _buildItem(
            'assets/tshirt.jpg',
            'T-Shirt',
            19.99,
            true,
          ),
          _buildItem(
            'assets/thermos.jpg',
            'Thermos',
            19.99,
            false,
          ),
          _buildItem(
            'assets/backpack.jpg',
            'Backpack',
            59.99,
            false,
          ),
          _buildItem(
            'assets/miles_card.jpg',
            'Miles Card',
            79.99,
            false,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyIt(basket: basket)),
              );
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String imagePath,
    String name,
    double price,
    bool hasSizeOptions,
  ) {
    String? selectedSize;
    int selectedQuantity = 1;

    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(imagePath, height: 100, width: 100),
          Text(name, style: const TextStyle(fontSize: 20)),
          if (hasSizeOptions)
            DropdownButton<String>(
              hint: const Text('Select Size'),
              value: selectedSize,
              onChanged: (newValue) {
                setState(() {
                  selectedSize = newValue!;
                });
              },
              items: <String>['XS', 'S', 'M', 'L', 'XL']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          Text('\$$price'),
          DropdownButton<int>(
            value: selectedQuantity,
            onChanged: (newValue) {
              setState(() {
                selectedQuantity = newValue!;
              });
            },
            items: List<int>.generate(10, (i) => i + 1)
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              addToBasket({
                'name': name,
                'size': selectedSize,
                'quantity': selectedQuantity,
                'price': price,
              });
            },
            child: const Text('Add to Basket'),
          ),
        ],
      ),
    );
  }
}
