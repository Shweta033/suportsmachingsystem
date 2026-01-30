import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 24 : 32,
      ),
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: Text(
          '© Spot Matching System',
          style: AppTextStyles.footer.copyWith(
            fontSize: isMobile ? 12 : 14,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
