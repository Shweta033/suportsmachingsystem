import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: spacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore SMS',
            style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2).copyWith(
              fontSize: isMobile ? 24 : 32,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Text(
            'Discover the Spot Matching System—the global standard for colour communication in print and packaging. Browse colours, learn about the colour system, and find resources for designers and brands.',
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _ExploreChip(
                label: 'What is SMS',
                onTap: () {},
              ),
              _ExploreChip(
                label: 'Colour System',
                onTap: () {},
              ),
              _ExploreChip(
                label: 'For Designers',
                onTap: () {},
              ),
              _ExploreChip(
                label: 'Shop SMS',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExploreChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ExploreChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondary,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            label,
            style: AppTextStyles.navItem.copyWith(
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
