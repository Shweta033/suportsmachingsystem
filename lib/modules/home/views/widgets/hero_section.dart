import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title: "The Spot Matching System v7" (stacked)
        Text(
          'The Spot',
          style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1).copyWith(
            fontSize: isMobile ? 28 : (isTablet ? 40 : 52),
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
        Text(
          'Matching',
          style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1).copyWith(
            fontSize: isMobile ? 28 : (isTablet ? 40 : 52),
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
        Text(
          'System v7',
          style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1).copyWith(
            fontSize: isMobile ? 28 : (isTablet ? 40 : 52),
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 28),
        // First subtitle
        Text(
          "The world's only 3C colour palette - CrossMedia Colour Consistency.",
          style: AppTextStyles.body.copyWith(
            fontSize: isMobile ? 14 : 17,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
        // Second subtitle
        Text(
          '2,607 CMYK-based colours designed for modern branding, printing, digital media, and real-world screens.',
          style: AppTextStyles.body.copyWith(
            fontSize: isMobile ? 14 : 17,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        SizedBox(height: isMobile ? 24 : 32),
        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.buttonText,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: isMobile ? 14 : 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: Text(
                'Shop SMS',
                style: AppTextStyles.button.copyWith(
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: isMobile ? 14 : 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Explore the System',
                style: AppTextStyles.button.copyWith(
                  fontSize: isMobile ? 14 : 16,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final cmykGraphic = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile ? 320 : (isTablet ? 380 : 480),
        maxHeight: isMobile ? 280 : (isTablet ? 360 : 440),
      ),
      child: Image.asset(
        'assets/images/hero_cmyk.png',
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _CmykPlaceholder(),
      ),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : (isTablet ? 56 : 72),
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                content,
                const SizedBox(height: 40),
                Center(child: cmykGraphic),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: isTablet ? 32 : 48),
                    child: content,
                  ),
                ),
                cmykGraphic,
              ],
            ),
    );
  }
}

/// Simple CMYK bars shown when hero_cmyk.png fails to load.
class _CmykPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _bar(AppColors.cyan, 'C'),
        const SizedBox(width: 12),
        _bar(AppColors.magenta, 'M'),
        const SizedBox(width: 12),
        _bar(AppColors.yellow, 'Y'),
        const SizedBox(width: 12),
        _bar(AppColors.keyBlack, 'K'),
      ],
    );
  }

  Widget _bar(Color color, String letter) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 120,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          letter,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
