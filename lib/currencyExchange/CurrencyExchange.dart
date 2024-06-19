import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({super.key, required String country});



  @override
  // ignore: library_private_types_in_public_api
  _CurrencyExchangeState createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  late double usdToGbpRate; // Define usdToGbpRate as late

  @override
  void initState() {
    super.initState();
    fetchExchangeRate('USD', 'GBP'); // Fetch exchange rate from USD to GBP
  }

  Future<void> fetchExchangeRate(String fromCurrency, String toCurrency) async {
    // Example logic to fetch exchange rate (replace with your implementation)
    try {
      // Simulate fetching exchange rate from an API or service
      // For demonstration, initializing usdToGbpRate with a dummy value
      await Future.delayed(const Duration(seconds: 2)); // Simulate delay

      // Replace this with your actual logic to fetch exchange rate
      usdToGbpRate = 0.75; // Example exchange rate

      setState(() {}); // Update the UI after fetching rate
    } catch (e) {
      // Handle errors here
      if (kDebugMode) {
        print('Error fetching exchange rate: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'USD to GBP Exchange Rate:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          // ignore: unnecessary_null_comparison
          usdToGbpRate != null // Check if usdToGbpRate is initialized
              ? Text(
                  '$usdToGbpRate',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              : const CircularProgressIndicator(), // Show loader while rate is being fetched
        ],
      ),
    );
  }
}
