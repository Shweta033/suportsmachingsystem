import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class WhatIsSmsView extends StatelessWidget {
  const WhatIsSmsView({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final headlineStyle = (isMobile ? AppTextStyles.h3 : AppTextStyles.h1)
        .copyWith(
          fontSize: isMobile ? 30 : (isTablet ? 38 : 44),
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
          height: 1.18,
          letterSpacing: -0.2,
        );

    final title = Text(
      'A Modern Colour\nSystem for a Multi-\nMedia World',
      style: headlineStyle,
    );

    final topRow = isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 28),
              const Center(child: _HeroIllustration()),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: isTablet ? 20 : 36),
                  child: title,
                ),
              ),
              const _HeroIllustration(),
            ],
          );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 36 : (isTablet ? 52 : 64),
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topRow,
              SizedBox(height: isMobile ? 26 : 34),
              Text(
                'SMS ensures your colours look right on:',
                style: AppTextStyles.body.copyWith(
                  fontSize: isMobile ? 12.5 : 14,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: isMobile ? 14 : 20),
              const _UseCaseGrid(),
              SizedBox(height: isMobile ? 24 : 30),
              Text(
                'SMS is the only colour system built for true 3C - CrossMedia Colour Consistency.',
                style: AppTextStyles.body.copyWith(
                  fontSize: isMobile ? 13.5 : 15.5,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UseCaseGrid extends StatelessWidget {
  const _UseCaseGrid();

  static const List<_UseCaseItem> _items = [
    _UseCaseItem(label: 'Packaging', icon: Icons.inventory_2_outlined),
    _UseCaseItem(label: 'Website', icon: Icons.web),
    _UseCaseItem(label: 'Mobile', icon: Icons.smartphone),
    _UseCaseItem(label: 'Social Media', icon: Icons.share_outlined),
    _UseCaseItem(label: 'TV Graphics', icon: Icons.tv_outlined),
    _UseCaseItem(label: 'Office Printer', icon: Icons.print_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final gap = isMobile ? 12.0 : 16.0;
        final targetWidth = isMobile ? 140.0 : 170.0;
        int columns = ((width + gap) / (targetWidth + gap)).floor();
        columns = columns.clamp(1, 4);
        if (columns == 3 && width < 740) {
          columns = 2;
        }

        final itemWidth = (width - gap * (columns - 1)) / columns;

        return Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: gap,
            runSpacing: gap,
            children: _items
                .map(
                  (item) => SizedBox(
                    width: itemWidth,
                    child: _UseCaseCard(item: item),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _UseCaseItem {
  final String label;
  final IconData icon;

  const _UseCaseItem({required this.label, required this.icon});
}

class _UseCaseCard extends StatelessWidget {
  final _UseCaseItem item;

  const _UseCaseCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 16 : 18,
        horizontal: isMobile ? 12 : 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            size: isMobile ? 24 : 28,
            color: AppColors.textPrimary,
          ),
          SizedBox(height: isMobile ? 8 : 10),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: isMobile ? 11.5 : 12.5,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroIllustration extends StatelessWidget {
  const _HeroIllustration();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final width = isMobile ? 250.0 : (isTablet ? 320.0 : 360.0);
    final height = isMobile ? 210.0 : (isTablet ? 250.0 : 270.0);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: width * 0.08,
            right: width * 0.08,
            top: height * 0.12,
            bottom: height * 0.12,
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(160),
                ),
              ),
            ),
          ),
          _Connector(
            left: width * 0.28,
            top: height * 0.36,
            width: width * 0.18,
            angle: -0.4,
          ),
          _Connector(
            left: width * 0.6,
            top: height * 0.24,
            width: width * 0.21,
            angle: 0.2,
          ),
          _Connector(
            left: width * 0.56,
            top: height * 0.62,
            width: width * 0.22,
            angle: 0.45,
          ),
          Positioned(
            child: Container(
              width: width * 0.4,
              height: width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.25),
                    AppColors.primary,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.public, color: Colors.white, size: 44),
              ),
            ),
          ),
          Positioned(
            left: width * 0.08,
            top: height * 0.2,
            child: _DeviceCard(
              width: width * 0.22,
              height: height * 0.34,
              child: const Icon(
                Icons.smartphone,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
          Positioned(
            right: width * 0.02,
            top: height * 0.1,
            child: _DeviceCard(
              width: width * 0.32,
              height: height * 0.24,
              child: const Icon(
                Icons.desktop_windows,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
          Positioned(
            right: width * 0.1,
            bottom: height * 0.16,
            child: _DeviceCard(
              width: width * 0.26,
              height: height * 0.22,
              child: const Icon(
                Icons.laptop_mac,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Connector extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  final double angle;

  const _Connector({
    required this.left,
    required this.top,
    required this.width,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: width,
          height: 2.5,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.65),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final bool showBadge;

  const _DeviceCard({
    required this.width,
    required this.height,
    required this.child,
    this.showBadge = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.22)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Center(child: child),
            if (showBadge)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.35),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 10,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
