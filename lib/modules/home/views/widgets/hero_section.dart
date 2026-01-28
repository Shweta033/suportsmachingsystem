import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          /// LOGO
          _Logo(),
          const Spacer(),

          /// MENU (Desktop)
          if (!isMobile) _DesktopMenu(),

          /// SHOP BUTTON
          if (!isMobile) ...[const SizedBox(width: 32), _ShopButton()],

          /// MOBILE MENU ICON
          if (isMobile)
            IconButton(
              onPressed: () {
                // later: open drawer / bottom sheet
              },
              icon: const Icon(Icons.menu),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Placeholder for logo icon
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Center(
            child: Text(
              'S',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'SPOT',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(
              'matching system',
              style: TextStyle(fontSize: 10, color: AppColors.textLight),
            ),
          ],
        ),
      ],
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  final List<String> items = const [
    'What is SMS',
    'Colour System',
    'Why Choose SMS',
    'For Designers',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(item, style: AppTextStyles.navItem),
            ),
          )
          .toList(),
    );
  }
}

class _ShopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 0,
      ),
      onPressed: () {},
      child: Text('Shop SMS', style: AppTextStyles.button),
    );
  }
}
