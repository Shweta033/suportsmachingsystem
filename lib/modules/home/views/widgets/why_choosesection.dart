import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  static final List<_FeatureItem> _items = [
    _FeatureItem(
      text: '3C: Cross Media Colour\nConsistency',
      icon: const _GradientIcon(icon: Icons.color_lens),
    ),
    _FeatureItem(
      text: 'Works across print, web,\nmobile, and TV',
      icon: Icon(Icons.devices, size: 22, color: AppColors.cyan),
    ),
    _FeatureItem(
      text: 'No proprietary inks or\nsubscriptions',
      icon: Icon(Icons.block, size: 22, color: AppColors.magenta),
    ),
    _FeatureItem(
      text: 'Accurate on both high-end\nand low-gamut displays',
      icon: Icon(Icons.monitor, size: 22, color: AppColors.cyan),
    ),
    _FeatureItem(
      text: '2,607 colours per system -\nour biggest palette ever',
      icon: const _CmykDots(),
    ),
    _FeatureItem(
      text: 'The most eco-friendly\ncolour system in the world',
      icon: Icon(Icons.eco, size: 22, color: AppColors.magenta),
    ),
    _FeatureItem(
      text: 'Future-proof for modern\nbranding',
      icon: Icon(Icons.rocket_launch, size: 22, color: AppColors.cyan),
    ),
    _FeatureItem(
      text: 'Built for global ISO printing\nstandards',
      icon: Icon(Icons.public, size: 22, color: AppColors.magenta),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final crossCount = Responsive.gridCrossAxisCount(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Container(
                width: 28,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.cyan.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: isMobile ? 18 : 24),
              Text(
                'Why Designers & Brands\nChoose SMS',
                textAlign: TextAlign.center,
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontSize: isMobile ? 24 : 32,
                      color: AppColors.primary,
                      height: 1.2,
                    ),
              ),
              SizedBox(height: isMobile ? 28 : 36),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (crossCount == 1) {
                    return Column(
                      children: _items
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _WhyChooseCard(item: e),
                            ),
                          )
                          .toList(),
                    );
                  }
                  final gap = 18.0;
                  final itemWidth = crossCount == 2
                      ? (constraints.maxWidth - gap) / 2
                      : (constraints.maxWidth - 2 * gap) / 3;
                  return Wrap(
                    alignment: WrapAlignment.center,
                    spacing: gap,
                    runSpacing: gap,
                    children: _items
                        .map(
                          (e) => SizedBox(
                            width: itemWidth,
                            child: _WhyChooseCard(item: e),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              SizedBox(height: isMobile ? 24 : 32),
              Container(
                width: 28,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.cyan.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WhyChooseCard extends StatelessWidget {
  final _FeatureItem item;

  const _WhyChooseCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 18,
        vertical: isMobile ? 14 : 18,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item.icon,
          const SizedBox(height: 10),
          Text(
            item.text,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontSize: isMobile ? 12.5 : 13.5,
              color: AppColors.textPrimary,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem {
  final String text;
  final Widget icon;

  const _FeatureItem({required this.text, required this.icon});
}

class _CmykDots extends StatelessWidget {
  const _CmykDots();

  @override
  Widget build(BuildContext context) {
    const dotSize = 10.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _Dot(color: AppColors.cyan, size: dotSize),
        SizedBox(width: 4),
        _Dot(color: AppColors.magenta, size: dotSize),
        SizedBox(width: 4),
        _Dot(color: AppColors.yellow, size: dotSize),
        SizedBox(width: 4),
        _Dot(color: AppColors.keyBlack, size: dotSize),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  final double size;

  const _Dot({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _GradientIcon extends StatelessWidget {
  final IconData icon;

  const _GradientIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [AppColors.cyan, AppColors.magenta, AppColors.yellow],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Icon(icon, size: 22, color: Colors.white),
    );
  }
}
