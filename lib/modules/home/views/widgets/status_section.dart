// import 'package:flutter/cupertino.dart';
//
// class StatsSection extends StatelessWidget {
//   const StatsSection({super.key});
//
//   Widget stat(String value, String label) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 6),
//         Text(label),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40),
//       child: Wrap(
//         spacing: 60,
//         runSpacing: 40,
//         alignment: WrapAlignment.center,
//         children: [
//           stat('359M', 'Companies Registered'),
//           stat('15,000+', 'SMS Colors'),
//           stat('ISO 12647', 'Based Standard'),
//         ],
//       ),
//     );
//   }
// }
