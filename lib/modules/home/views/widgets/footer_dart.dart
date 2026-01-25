import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: const [
          Divider(),
          SizedBox(height: 20),
          Text('© Spot Matching System'),
        ],
      ),
    );
  }
}
