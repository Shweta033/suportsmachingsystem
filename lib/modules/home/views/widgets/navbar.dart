import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LOGO
           _Logo(),

          // const SizedBox(width: 32),

          /// MENU (THIS FIXES OVERFLOW)
          SizedBox(
            width: MediaQuery.of(context).size.width*0.20,
            child: _DesktopMenu(),
          ),

          const SizedBox(width: 24),

          /// CTA BUTTON
           _ShopButton(),
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
  const _DesktopMenu({super.key});

  final List<String> items = const [
    'What is SMS',
    'Colour System',
    'Why Choose SMS',
    'For Designers',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Wrap(
        spacing: 13,
        runSpacing: 12,
        alignment: WrapAlignment.end,
        children: items
            .map(
              (item) => Text(
            item,
            style: AppTextStyles.navItem,
          ),
        )
            .toList(),
      ),
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
