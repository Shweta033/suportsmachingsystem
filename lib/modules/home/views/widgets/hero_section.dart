import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Widget stat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Wrap(
        spacing: 60,
        runSpacing: 40,
        alignment: WrapAlignment.center,
        children: [
          stat('359M', 'Companies Registered'),
          stat('15,000+', 'SMS Colors'),
          stat('ISO 12647', 'Based Standard'),
        ],
      ),
    );
  }
}

class HeroStats extends StatelessWidget {
  const HeroStats({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.buttonPrimary, // light cream bg
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 56,
      ),
      child: isMobile
          ? Column(children: _stats())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _stats(),
            ),
    );
  }

  List<Widget> _stats() {
    return const [
      _StatItem(value: '359.000.000', label: 'Company Registered'),
      _StatItem(value: '15.000', label: 'SMS Colours'),
      _StatItem(value: 'ISO 12647', label: 'Based Colour'),
    ];
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: AppColors.background,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: AppColors.textLight),
        ),
      ],
    );
  }
}
