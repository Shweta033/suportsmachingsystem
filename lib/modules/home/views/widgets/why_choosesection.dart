import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  static const List<Map<String, String>> _items = [
    {
      'title': 'Industry standard',
      'body': 'SMS is the globally recognised standard for colour matching in print and packaging.',
    },
    {
      'title': '15,000+ colours',
      'body': 'Access the full SMS colour library for consistent, reproducible colour across materials.',
    },
    {
      'title': 'For designers & brands',
      'body': 'Specify and communicate colour with confidence using SMS references.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final crossCount = Responsive.gridCrossAxisCount(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.secondary,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: spacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Choose SMS',
            style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2).copyWith(
              fontSize: isMobile ? 24 : 32,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (crossCount == 1) {
                return Column(
                  children: _items
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: _WhyChooseCard(
                              title: e['title']!,
                              body: e['body']!,
                            ),
                          ))
                      .toList(),
                );
              }
              final gap = 24.0;
              final itemWidth = crossCount == 2
                  ? (constraints.maxWidth - gap) / 2
                  : (constraints.maxWidth - 2 * gap) / 3;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: _items
                    .map((e) => SizedBox(
                          width: itemWidth,
                          child: _WhyChooseCard(
                            title: e['title']!,
                            body: e['body']!,
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _WhyChooseCard extends StatelessWidget {
  final String title;
  final String body;

  const _WhyChooseCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.h3.copyWith(
              fontSize: 18,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
