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
    final crossCount = Responsive.gridCrossAxisCount(context);

    final items = [
      const _ExploreItem(
        title: 'SMS Standard (P20)',
        body: 'Natural, balanced colours for web, TV, and CMYK printing',
      ),
      const _ExploreItem(
        title: 'SMS Max (P20x)',
        body:
            'Vivid colours for coated print, packaging, signage, web, and TV.',
      ),
      const _ExploreItem(
        title: 'SMS Eco (P20e)',
        body: 'Earthy, natural colours for recycled, and uncoated papers',
      ),
      const _ExploreItem(
        title: 'SMS Max Home & Office (P20xo)',
        body: 'Vivid colours low-gamut customer displays.',
      ),
      const _ExploreItem(
        title: 'SMS Standard Home & Office (P20o)',
        body: 'Standard colours optimised for laptop displays',
      ),
      const _ExploreItem(
        title: 'SMS Super Max(P20sx)',
        body: 'Super-vivid colours for Extended Gamut printing',
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'Explore the SMS System',
                textAlign: TextAlign.center,
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontSize: isMobile ? 24 : 32,
                      color: AppColors.primary,
                    ),
              ),
              SizedBox(height: isMobile ? 24 : 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (crossCount == 1) {
                    return Column(
                      children: items
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _ExploreCard(item: item),
                            ),
                          )
                          .toList(),
                    );
                  }
                  final gap = 18.0;
                  final itemWidth = (constraints.maxWidth - gap) / 2;
                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: items
                        .map(
                          (item) => SizedBox(
                            width: itemWidth,
                            child: _ExploreCard(item: item),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              SizedBox(height: isMobile ? 40 : 56),
              Text(
                'Trusted Worldwide',
                textAlign: TextAlign.center,
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontSize: isMobile ? 24 : 32,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'SMS is used by designers, agencies, printers, and brand owners who need colour that works everywhere not just in perfect conditions.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    fontSize: isMobile ? 13.5 : 15.5,
                    color: AppColors.textSecondary,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreItem {
  final String title;
  final String body;

  const _ExploreItem({required this.title, required this.body});
}

class _ExploreCard extends StatelessWidget {
  final _ExploreItem item;

  const _ExploreCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: AppTextStyles.h3.copyWith(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.body,
            style: AppTextStyles.body.copyWith(
              fontSize: 13.5,
              color: AppColors.textSecondary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Learn more',
                style: AppTextStyles.body.copyWith(
                  fontSize: 13.5,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.arrow_right_alt, size: 18, color: AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
