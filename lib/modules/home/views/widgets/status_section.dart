import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            spacing: isMobile ? 24 : 48,
            runSpacing: isMobile ? 24 : 32,
            alignment: WrapAlignment.center,
            children: [
              _StatItem(
                value: '359M',
                label: 'Companies Registered',
              ),
              _StatItem(
                value: '15,000+',
                label: 'SMS Colors',
              ),
              _StatItem(
                value: 'ISO 12647',
                label: 'Based Standard',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: (isMobile ? AppTextStyles.h3 : AppTextStyles.statNumber).copyWith(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTextStyles.statLabel.copyWith(
            fontSize: isMobile ? 12 : 14,
            color: AppColors.textLight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
