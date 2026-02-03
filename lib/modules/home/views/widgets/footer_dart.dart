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
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 26 : 36,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FooterTop(isMobile: isMobile, isTablet: isTablet),
              SizedBox(height: isMobile ? 20 : 28),
              Container(height: 1, color: AppColors.border.withOpacity(0.7)),
              SizedBox(height: isMobile ? 16 : 22),
              Column(
                children: [
                  Text(
                    'SpotNordic- Manufacturer of the Spot Matching System',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.footer.copyWith(
                      fontSize: isMobile ? 12 : 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'www.spot-nordic.com',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.footer.copyWith(
                      fontSize: isMobile ? 12 : 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterTop extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const _FooterTop({required this.isMobile, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final headingStyle = AppTextStyles.body.copyWith(
      fontSize: isMobile ? 13 : 14,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );
    final linkStyle = AppTextStyles.body.copyWith(
      fontSize: isMobile ? 12.5 : 13.5,
      color: AppColors.textSecondary,
      height: 1.8,
    );

    final columns = [
      _FooterColumn(
        title: 'Product',
        items: const ['Shop', 'Colour System'],
        headingStyle: headingStyle,
        itemStyle: linkStyle,
      ),
      _FooterColumn(
        title: 'Resources',
        items: const [
          'What is SMS',
          'Articles & Webinars',
          'SMS News',
          'SMS vs Pantone',
        ],
        headingStyle: headingStyle,
        itemStyle: linkStyle,
      ),
      _FooterColumn(
        title: 'Company',
        items: const ['About', 'Support', 'LinkedIn'],
        headingStyle: headingStyle,
        itemStyle: linkStyle,
      ),
      _FooterColumn(
        title: 'Legal',
        items: const ['Legal', 'Terms', 'Privacy'],
        headingStyle: headingStyle,
        itemStyle: linkStyle,
      ),
    ];

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _FooterBrand(),
              const SizedBox(height: 22),
              ...columns.map(
                (c) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: c,
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 3, child: _FooterBrand()),
              const SizedBox(width: 24),
              Expanded(
                flex: 7,
                child: Wrap(
                  spacing: isTablet ? 28 : 48,
                  runSpacing: 18,
                  children: columns
                      .map(
                        (c) => SizedBox(width: isTablet ? 150 : 180, child: c),
                      )
                      .toList(),
                ),
              ),
            ],
          );
  }
}

class _FooterBrand extends StatelessWidget {
  const _FooterBrand();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ColorBar(),
        const SizedBox(height: 8),
        Text(
          'SPOT',
          style: AppTextStyles.h2.copyWith(
            fontSize: 44,
            color: AppColors.primary,
            letterSpacing: 6,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'matching system',
          style: AppTextStyles.body.copyWith(
            fontSize: 12.5,
            color: AppColors.primary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mail, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'support@spotmatchingsystem.com',
              style: AppTextStyles.body.copyWith(
                fontSize: 12.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ColorBar extends StatelessWidget {
  const _ColorBar();

  @override
  Widget build(BuildContext context) {
    const barHeight = 6.0;
    const barWidth = 120.0;
    final colors = [
      const Color(0xFF5B5B5B),
      const Color(0xFFE85D5D),
      const Color(0xFFF3C54E),
      const Color(0xFF4BC0C8),
      const Color(0xFF4A90E2),
      const Color(0xFFB56BE2),
      const Color(0xFF8BC34A),
      const Color(0xFFFFD54F),
    ];

    return SizedBox(
      width: barWidth,
      height: barHeight,
      child: Row(
        children: colors
            .map((c) => Expanded(child: Container(color: c)))
            .toList(),
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  final TextStyle headingStyle;
  final TextStyle itemStyle;

  const _FooterColumn({
    required this.title,
    required this.items,
    required this.headingStyle,
    required this.itemStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: headingStyle),
        const SizedBox(height: 8),
        ...items.map((item) => Text(item, style: itemStyle)).toList(),
      ],
    );
  }
}
