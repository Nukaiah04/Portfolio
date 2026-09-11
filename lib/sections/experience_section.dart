import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Professional Experience"),
          ...PortfolioData.experience.map((exp) => ExperienceItem(experience: exp)),
        ],
      ),
    );
  }
}
