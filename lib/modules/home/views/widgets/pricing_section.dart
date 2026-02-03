import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final spacing = Responsive.sectionSpacing(context);
    final isMobile = Responsive.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'SMS READY Expert',
                textAlign: TextAlign.center,
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontSize: isMobile ? 22 : 30,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: isMobile ? 20 : 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final availableWidth = constraints.hasBoundedWidth
                      ? constraints.maxWidth
                      : screenWidth;
                  final safeWidth =
                      availableWidth.isFinite && availableWidth > 0
                      ? availableWidth
                      : screenWidth;
                  final useColumn = safeWidth < 900;
                  final isNarrow = safeWidth < 420;
                  final contentPadding = EdgeInsets.symmetric(
                    horizontal: isMobile ? 10 : 18,
                    vertical: isMobile ? 10 : 16,
                  );
                  final sidePadding = EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 24,
                    vertical: isMobile ? 20 : 28,
                  );

                  Widget leftContent() {
                    return Padding(
                      padding: contentPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Become SMS READY Expert',
                            style: AppTextStyles.h3.copyWith(
                              fontSize: isMobile ? 17 : 19,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Professional training that ensures SMS colours are used and reproduced correctly - from design to print, web, and video.',
                            style: AppTextStyles.body.copyWith(
                              fontSize: isMobile ? 13 : 14,
                              color: AppColors.textSecondary,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Text(
                                'Required for',
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.border,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Wrap(
                            spacing: 20,
                            runSpacing: 12,
                            children: const [
                              _CheckItem(label: 'SMS READY agencies'),
                              _CheckItem(label: 'SMS READY print shops'),
                              _CheckItem(label: 'SMS dealers'),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  Widget rightContent() {
                    return Container(
                      width: double.infinity,
                      padding: sidePadding,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F2EF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.border.withOpacity(0.7),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Remote training & diploma',
                            style: AppTextStyles.body.copyWith(
                              fontSize: isNarrow ? 11.5 : 12.5,
                              color: AppColors.textLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 18),
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.h2.copyWith(
                                fontSize: isNarrow ? 26 : (isMobile ? 30 : 34),
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                const TextSpan(text: '€60'),
                                TextSpan(
                                  text: '  EURO',
                                  style: AppTextStyles.body.copyWith(
                                    fontSize: isNarrow ? 11 : 12,
                                    color: AppColors.textLight,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: useColumn ? double.infinity : 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.buttonText,
                                padding: EdgeInsets.symmetric(
                                  vertical: isMobile ? 12 : 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Learn more',
                                style: AppTextStyles.button.copyWith(
                                  fontSize: isMobile ? 13.5 : 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final gap = 18.0;
                  final leftWidth = useColumn
                      ? safeWidth
                      : ((safeWidth - gap) * 0.6).clamp(320.0, safeWidth);
                  final rightWidth = useColumn
                      ? safeWidth
                      : ((safeWidth - gap) * 0.4).clamp(260.0, safeWidth);

                  return SizedBox(
                    width: safeWidth,
                    child: Container(
                      padding: EdgeInsets.all(isMobile ? 14 : 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.border.withOpacity(0.9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: useColumn
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  width: leftWidth,
                                  child: leftContent(),
                                ),
                                SizedBox(height: isNarrow ? 14 : 18),
                                SizedBox(
                                  width: rightWidth,
                                  child: rightContent(),
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  width: leftWidth,
                                  child: leftContent(),
                                ),
                                const SizedBox(width: 18),
                                SizedBox(
                                  width: rightWidth,
                                  child: rightContent(),
                                ),
                              ],
                            ),
                    ),
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

class _CheckItem extends StatelessWidget {
  final String label;

  const _CheckItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check, size: 18, color: AppColors.textPrimary),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            fontSize: 12.5,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
