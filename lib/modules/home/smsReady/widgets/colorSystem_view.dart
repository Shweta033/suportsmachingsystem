import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class ColourSystemView extends StatelessWidget {
  const ColourSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Smsbackground,
      body: SingleChildScrollView(
        child: Column(children: const [NavBar(), ColourSystemBody(), Footer()]),
      ),
    );
  }
}

class ColourSystemBody extends StatelessWidget {
  const ColourSystemBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ColourSystemItem> items = [
      _ColourSystemItem(
        title: 'SMS Standard (P20)',
        description:
            'Natural, balanced colours for web, TV, and CMYK printing on both white coated and uncoated paper.\nPerfect for most brands and everyday design work.',
      ),
      _ColourSystemItem(
        title: 'SMS Standard Home & Office (P20o)',
        description:
            'Standard colours with a reduced colour gamut, optimised for laptop displays that only show ≈60% sRGB / 45% NTSC.\nMost customers use inexpensive laptops not designer displays.\nThis palette ensures your customers see your colours correctly.',
      ),
      _ColourSystemItem(
        title: 'SMS Eco (P20e)',
        description:
            'Vivid colours for coated print, packaging, signage, web, and TV.\nNot suitable for uncoated paper these colours are too saturated for that medium.',
      ),
      _ColourSystemItem(
        title: 'SMS MAX (P20x)',
        description:
            'Natural, balanced colours for web, TV, and CMYK printing on both white coated and uncoated paper.\nPerfect for most brands and everyday design work.',
      ),
      _ColourSystemItem(
        title: 'SMS MAX Home & Office (P20xo)',
        description:
            'MAX colours with a reduced gamut for lowgamut customer displays.\nEnsures vivid colours still look correct on inexpensive laptops.',
      ),
      _ColourSystemItem(
        title: 'SMS SuperMAX (P20sx)',
        description:
            'Super-vivid colours for Extended Gamut printing (FOGRA59, CRPC7, XCMYK, CMYKOGV).\nIdeal for packaging and high impact digital graphics.\nNot suitable for uncoated paper or general brand design.',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SMS V7 Colour Systems',
            style: AppTextStyles.h2.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 32),
          ...items.map((item) => _ColourSystemCard(item: item)).toList(),
        ],
      ),
    );
  }
}

class _ColourSystemItem {
  final String title;
  final String description;

  _ColourSystemItem({required this.title, required this.description});
}

class _ColourSystemCard extends StatelessWidget {
  final _ColourSystemItem item;

  const _ColourSystemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: AppTextStyles.h3.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Shop ${item.title}',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
