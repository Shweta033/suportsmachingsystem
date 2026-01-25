import 'package:flutter/material.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          const Text(
            'SMS Ready Expert',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text('\$60 / year'),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('Learn more')),
        ],
      ),
    );
  }
}
