import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class SustainabilityView extends StatelessWidget {
  const SustainabilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F7),
      body: SingleChildScrollView(
        child: Column(
          children: const [NavBar(), SustainabilityContent(), Footer()],
        ),
      ),
    );
  }
}

class SustainabilityContent extends StatelessWidget {
  const SustainabilityContent({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SMS & Sustainability',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 36 : 56,
                      color: const Color(0xFF7A4A3A),
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                "The world's most environmentally responsible colour palette",
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              Text(
                'Natural by Design- Natural in Impact',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                'The 15,000+ colours of the Spot Matching System have a subtle, natural character, much like the landscapes of Iceland. But SMS colours don’t just look natural.',
                style: AppTextStyles.body.copyWith(
                  height: 1.3,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'They actively reduce your carbon footprint.',
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 32),

              // Research Box
              _ImpactBox(),
              const SizedBox(height: 50),

              // Circular Economy Title
              Center(
                child: Text(
                  'SMS for the Circular Economy',
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                        fontSize: isMobile ? 32 : 42,
                      ),
                ),
              ),
              const SizedBox(height: 20),

              // Grid of Cards
              _CircularEconomyGrid(),
              const SizedBox(height: 60),

              _ThinkGloballySection(),
              const SizedBox(height: 80),

              // CTA Section
              _ReadyToSwitchSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImpactBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.trending_down, color: Color(0xFFE56A54), size: 32),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: AppTextStyles.body.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                height: 1.6,
              ),
              children: [
                const TextSpan(
                  text:
                      'Research by Dr. Kai Lankinen shows that moving from '
                      'traditional spot colours to process '
                      'based printing can reduce the carbon '
                      'footprint of a print job by up to ',
                ),
                TextSpan(
                  text: '51%.',
                  style: TextStyle(
                    color: const Color(0xFFE56A54),
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'SMS colours require only 4colour CMYK, '
            'not 7colour CMYK+OGV, meaning the '
            'environmental benefit is immediate.',
            style: AppTextStyles.body.copyWith(
              height: 1.6,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'If 7colour printing reduces emissions dramatically, then 4colour SMS printing reduces them even more.',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularEconomyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 800;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: const [
            _SustainCard(
              icon: Icons.print_outlined,
              title: 'Print Anywhere - No Special Inks Required',
              content: [
                'SMS colours are designed for standard CMYK printing',
                'No special inks  |  No special press units  |  No special equipment',
                'No special equipment',
                'Any print shop using ISO 12647 can print SMS colours',
                'Your brand colours can be printed:',
              ],
              checklist: [
                'Locality',
                'Digitally',
                'Offset',
                'Flexo',
                'Gravure',
                'Even on you office printer',
              ],
              footer:
                  '1,750 SMS ECO colours can even be printed correctly in a newspaper.',
            ),
            _SustainCard(
              icon: Icons.wash_outlined,
              title: 'No Press Washing - No Chemical Waste',
              content: [
                'Traditional spot colours require:',
                'Washing a press unit  |  Using strong chemicals  |  Mixing special inks',
                'Extra set up time  |  Extra waste  |  Extra cost',
                'SMS eliminate all of this.',
                'With SMS:',
              ],
              checklist: [
                'No washing',
                'No chemicals',
                'No special inks',
                'No extra press units',
                'No added environment impact',
              ],
              footer:
                  'You can use as many SMS colours as you want without increasing cost or carbon footprint.',
            ),
            _SustainCard(
              icon: Icons.eco_outlined,
              title: 'Uncoated Paper= Better for the Planet',
              content: [
                'Uncoated paper:',
                'Looks natural  |  Feels environmentally conscious',
                'Is often less expensive  |  Yields more recyclable fiber',
                'Produces less waste sludge than coated paper',
                'SMS ECO colours are optimized for:',
              ],
              checklist: [
                'Off-white paper',
                '100% recycled paper',
                'Newspaper printing (ISO 12647)',
                'SMS colours - both Standard and ECO - print beautifully on uncoated and recycled papers',
              ],
            ),
            _SustainCard(
              icon: Icons.approval_outlined,
              title: 'Digital Approvals Reduce Waste',
              content: [
                'Designers do not need printed colour guides.',
                'SMS is designed for sRGB workflows.',
                'A designer can:',
              ],
              checklist: [
                'Choose SMS colours digitally',
                'Send a digital proof',
                'Have the client approve colours on any smartphone, tablet, or laptop',
              ],
              footer:
                  'Printed proofs are only needed when required- and can be produced by any ISO compliant proofing facility.',
            ),
            _SustainCard(
              icon: Icons.location_on_outlined,
              title: 'Local Printing = Lower Emissions',
              content: [
                'Delivering brand colours with mixed spot inks often forces companies to print far from home.',
                'SMS enables local printing, reducing:',
              ],
              checklist: [
                'Transport emissions',
                'Shipping costs',
                'Shipping costs',
                'Environmental impact',
              ],
              footer:
                  'Even small local print shops can print SMS colours correctly.',
            ),
          ],
        );
      },
    );
  }
}

class _SustainCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> content;
  final List<String> checklist;
  final String? footer;

  const _SustainCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.checklist,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      width: isMobile ? double.infinity : (1100 / 2) - 15,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFE56A54), size: 28),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.black,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 16),
          ...content.map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                text,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textPrimary.withOpacity(0.8),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: checklist
                .map(
                  (item) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item,
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          if (footer != null) ...[
            const SizedBox(height: 20),
            Text(
              footer!,
              style: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFFE56A54),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ThinkGloballySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFFE9D8D5).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Think Globally Print Locally',
            style: AppTextStyles.h2.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.black,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'By choosing SMS colours, brand owners:',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          _BenefitsList(),
          const SizedBox(height: 32),
          Text(
            'Even the smallest company can make a visible environmental impact simply by choosing SMS',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final benefits = [
      'Reduce their carbon footprint',
      'Support local printers',
      'Avoid unnecessary shipping',
      'Reduce waste',
      'Use colours that work on recycled and uncoated papers',
      'Eliminate the need for special inks',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: benefits
          .map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 18,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    benefit,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ReadyToSwitchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Ready to Switch to SMS?',
            style: AppTextStyles.h2.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 36,
              color: const Color(0xFF4A4A4A),
            ),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
              children: [
                const TextSpan(
                  text: 'Contact: ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: 'Support@spotmatchingsystem.com',
                  style: TextStyle(
                    color: const Color(0xFFE56A54),
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'We are happy to assist you',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
