import 'package:flutter/material.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class WhatIsSmsView extends StatelessWidget {
  const WhatIsSmsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.Smsbackground,
          child: Column(children: [NavBar(), WhatIsSmsViewContent(), Footer()]),
        ),
      ),
    );
  }
}

class WhatIsSmsViewContent extends StatelessWidget {
  const WhatIsSmsViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _WhySmsExistsSection(),
        _VersionSevenSection(),
        _ExploreSystemSection(),
      ],
    );
  }
}

class _WhySmsExistsSection extends StatelessWidget {
  const _WhySmsExistsSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Why SMS Exists',
              textAlign: TextAlign.center,
              style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2).copyWith(
                fontSize: isMobile ? 24 : 32,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 16),
            Text(
              'Traditional spot ink systems were created for print-only workflows. Today, brands live everywhere.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: isMobile ? 32 : 44),
            Text(
              'The Problem:',
              style: AppTextStyles.body.copyWith(
                fontSize: 18,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'How do you keep colour consistent across both print and digital media?',
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: 15,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: isMobile ? 24 : 32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: _ProblemApproachCard(
                title: 'The SMS Approach',
                isApproach: true,
                points: const [
                  'LAB-anchored colours',
                  'CMYK builds aligned with ISO standards',
                  'sRGB-based digital colours',
                  'Home & Office palettes for low-gamut displays',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProblemApproachCard extends StatelessWidget {
  final String title;
  final String? body;
  final List<String>? points;
  final bool isApproach;

  const _ProblemApproachCard({
    required this.title,
    this.body,
    this.points,
    this.isApproach = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border.withOpacity(0.5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.h3.copyWith(
              fontSize: 22,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          if (body != null)
            Text(
              body!,
              style: AppTextStyles.body.copyWith(
                fontSize: 15,
                color: AppColors.textSecondary,
              ),
            ),
          if (points != null)
            ...points!.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 15,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _VersionSevenSection extends StatelessWidget {
  const _VersionSevenSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.Smsbackground,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Version 7 - Our Biggest Update Ever',
                  textAlign: TextAlign.center,
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontSize: isMobile ? 24 : 32,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'SMS v7 includes:',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    fontSize: isMobile ? 14 : 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 32 : 44),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns;
                  if (width < 450) {
                    columns = 1;
                  } else if (width < 800) {
                    columns = 2;
                  } else {
                    columns = 3;
                  }
                  final gap = isMobile ? 12.0 : 16.0;
                  final cardWidth = (width - gap * (columns - 1)) / columns;

                  final items = const [
                    _StatItem(label: 'Colours from v6', value: '1,738'),
                    _StatItem(label: 'New colours', value: '+869'),
                    _StatItem(label: 'Total colours', value: '2,608'),
                  ];

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _StatCard(item: items[0], showDivider: true),
                      ),
                      Expanded(
                        child: _StatCard(item: items[1], showDivider: true),
                      ),
                      Expanded(child: _StatCard(item: items[2])),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});
}

class _StatCard extends StatelessWidget {
  final _StatItem item;
  final bool showDivider;

  const _StatCard({required this.item, this.showDivider = false});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.value,
                  style: AppTextStyles.h3.copyWith(
                    fontSize: isMobile ? 28 : 34,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (showDivider)
            Container(
              width: 1,
              height: 40,
              color: AppColors.border.withOpacity(0.8),
            ),
        ],
      ),
    );
  }
}

class _ExploreSystemSection extends StatelessWidget {
  const _ExploreSystemSection();

  static const _cards = [
    _ExploreCardData(
      title: 'SMS Standard (P20)',
      body:
          'Industrial, brand colours for retail, TV, and CMYK print workflows.',
    ),
    _ExploreCardData(
      title: 'SMS Max (P20x)',
      body: 'Vivid colours for retail print, packaging, signage, web, and TV.',
    ),
    _ExploreCardData(
      title: 'SMS Eco (P20e)',
      body: 'Eco-friendly colours for recycled and uncoated papers.',
    ),
    _ExploreCardData(
      title: 'SMS Max Home & Office (P20xo)',
      body: 'Optimised colours for low-gamut displays and office printing.',
    ),
    _ExploreCardData(
      title: 'SMS Standard Home & Office (P20o)',
      body: 'Standard colours optimised for laptop displays and printing.',
    ),
    _ExploreCardData(
      title: 'SMS Super Max (P20sx)',
      body: 'Super wide colour set for extended gamut printing.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.Smsbackground,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Explore the SMS System',
                  textAlign: TextAlign.center,
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontSize: isMobile ? 24 : 32,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              SizedBox(height: isMobile ? 32 : 44),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns;
                  if (width < 450) {
                    columns = 1;
                  } else if (width < 800) {
                    columns = 2;
                  } else {
                    columns = 3;
                  }
                  final gap = isMobile ? 12.0 : 16.0;
                  final cardWidth = (width - gap * (columns - 1)) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: _cards
                        .map(
                          (item) => SizedBox(
                            width: cardWidth,
                            child: _ExploreCard(item: item),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreCardData {
  final String title;
  final String body;

  const _ExploreCardData({required this.title, required this.body});
}

class _ExploreCard extends StatelessWidget {
  final _ExploreCardData item;

  const _ExploreCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.body,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Learn more →',
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

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
