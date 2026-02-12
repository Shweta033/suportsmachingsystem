import 'package:flutter/material.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F7),
      body: SingleChildScrollView(
        child: Column(children: const [NavBar(), SupportContent(), Footer()]),
      ),
    );
  }
}

class SupportContent extends StatelessWidget {
  const SupportContent({super.key});

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
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Segment
              Text(
                'Support',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 36 : 56,
                      color: const Color(0xFF8A4D3D), // Specific brand brown
                    ),
              ),
              const SizedBox(height: 32),
              Text(
                'For technical questions, training, certification, or colour assistance:',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Support@spotmatchingsystem.com',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 80),

              // FAQ Title
              Center(
                child: Text(
                  'Frequently asked questions',
                  style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                      .copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile ? 30 : 44,
                        color: const Color(0xFF333333),
                      ),
                ),
              ),
              const SizedBox(height: 48),

              // FAQ Items
              _FaqItem(
                question: 'Do I need special inks to print SMS colours?',
                answer:
                    'No. SMS colours are printed using standard CMYK according to ISO 12647.',
              ),
              _FaqItem(
                question: 'Do I need a printed colour guide?',
                answer:
                    'Designers do not need printed colour guides. SMS is designed for digital and standard process workflows.',
              ),
              _FaqItem(
                question:
                    'Can SMS colours can be printed on off-white uncoated or recycled paper?',
                answer:
                    'Yes. SMS ECO colours print beautifully on off-white uncoated and recycled papers.',
                isExpanded: true,
              ),
              _FaqItem(
                question:
                    'Can my customers approve colours on their own screens?',
                answer:
                    'Yes, SMS colours behave predictably across different displays and devices.',
              ),
              _FaqItem(
                question: 'Do I need a high-end monitor?',
                answer:
                    'While professional monitors are always better, SMS ensures consistency even on standard office laptops.',
              ),
              _FaqItem(
                question: 'Can SMS colours be used for packaging?',
                answer:
                    'Yes. SMS is widely used in packaging design and production.',
              ),
              _FaqItem(
                question: 'How do I become SMS READY?',
                answer:
                    'You can become SMS READY by completing our expert certification training.',
              ),
              _FaqItem(
                question: 'Can I use SMS and Pantone colours together?',
                answer:
                    'Yes, of course. Pantone spot colours, metallics or fluorescents should be used independently whenever a job requires traditional spotink printing. SMS colours, on the other hand, are designed for CMYK or CMYKOGV workflows. Many designers use both systems in the same layout -for example, images and SMS colours remain in native CMYK, while Pantone spot colours are printed separately on top as specialty inks. This is a perfectly valid and common workflow. See further comparison [here].',
                isExpanded: true,
              ),
              _FaqItem(
                question: 'How do I register my brand colours?',
                answer:
                    'Send your SMS colours and sRGB layouts to :\n\nSupport@spotmatchingsystem.com',
                isExpanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isExpanded;

  const _FaqItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFF4A4A4A),
                      ),
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Text(
                widget.answer,
                style: AppTextStyles.bodySmall.copyWith(
                  height: 1.5,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
