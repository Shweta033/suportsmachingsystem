import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F6),
      body: SingleChildScrollView(
        child: Column(children: const [NavBar(), ShopContent(), Footer()]),
      ),
    );
  }
}

class ShopContent extends StatelessWidget {
  const ShopContent({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Shop SMS',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 36 : 56,
                      color: const Color(0xFF8A4D3D),
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                'Purchase SMS Colour systems, training, certification adn professional tools.',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 100),

              // V7 Category
              Center(
                child: Text(
                  'V7 Colour System',
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile ? 32 : 44,
                        color: const Color(0xFF333333),
                      ),
                ),
              ),
              const SizedBox(height: 48),

              // V7 Grid
              _ProductGrid(
                children: const [
                  _ProductCard(
                    title: 'SMS Standard (P20)',
                    features: [
                      '2607 natural, balanced colours for print, web, mobile & TV',
                      'Perfect for most brands and everyday design work',
                    ],
                    buttonText: 'Buy SMS Standard (P20)',
                  ),
                  _ProductCard(
                    title: 'SMS Standard Home & Office (P20o)',
                    features: [
                      '2607 colours optimized for lowgamut laptop displays (≈ 60% sRGB/ 45% NTSC)',
                      'Ensures your customers see your colours correctly',
                    ],
                    buttonText: 'Buy SMS Standard Home & Office (P20o)',
                  ),
                  _ProductCard(
                    title: 'SMS ECO (P20e)',
                    features: [
                      '2607 earthy, natural colours designed for recycles, offwhite and uncoated papers',
                      'Perfect for sustainable brands and newspaper printing',
                    ],
                    buttonText: 'Buy SMS ECO (P20e)',
                  ),
                  _ProductCard(
                    title: 'SMS MAX (P20x)',
                    features: [
                      '2607 vivid colours for coated print, packaging, signage, web and TV',
                    ],
                    buttonText: 'Buy SMS MAX (P20x)',
                  ),
                  _ProductCard(
                    title: 'SMS MAX Home & Office (P20xo)',
                    features: [
                      '2607 vivid colours optimized for lowgamut laptop displays',
                    ],
                    buttonText: 'Buy SMS MAX Home & Office (P20xo)',
                  ),
                  _ProductCard(
                    title: 'SMS SuperMAX (P20sx)',
                    features: [
                      '2607 supervivid colours for Extended Gamut printing ( FOGRA59, CRPC7, XCMYK, CMYKOGV)',
                    ],
                    buttonText: 'Buy SMS SuperMAX (P20sx)',
                  ),
                ],
              ),

              const SizedBox(height: 120),

              // Training Category
              Center(
                child: Text(
                  'Training & Certification',
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile ? 32 : 44,
                        color: const Color(0xFF333333),
                      ),
                ),
              ),
              const SizedBox(height: 48),

              // Training Grid
              _ProductGrid(
                children: const [
                  _ProductCard(
                    title: 'SMS READY Expert Training (P21)',
                    features: [
                      'Professional certification for designers, agencies and print shops',
                    ],
                    buttonText: 'Buy SMS READY Expert Training (P21)',
                  ),
                  _ProductCard(
                    title: 'SMS READY Agency Certification (P43)',
                    features: ['For Advertising and creative agency'],
                    buttonText: 'Buy SMS READY Agency Certification (P43)',
                  ),
                  _ProductCard(
                    title: 'SMS READY Print Shop Certification (P45)',
                    features: ['For Professional print shops'],
                    buttonText: 'Buy SMS READY Print Shop Certification (P45)',
                  ),
                  _ProductCard(
                    title: 'SMS Subscription for Brand Owners (P40)',
                    features: ['Full Colour Management support'],
                    buttonText: 'Buy SMS Subscription (P40)',
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

class _ProductGrid extends StatelessWidget {
  final List<Widget> children;
  const _ProductGrid({required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 700;
        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: children.map((card) {
            return SizedBox(
              width: isMobile ? double.infinity : (width / 2) - 12,
              child: card,
            );
          }).toList(),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final List<String> features;
  final String buttonText;

  const _ProductCard({
    required this.title,
    required this.features,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 24),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.black.withOpacity(0.8),
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8A5B4E), // Rust brown
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
