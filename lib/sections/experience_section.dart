import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 100px top padding ensures ample clearance below the sticky navbar
      padding: const EdgeInsets.only(top: 100, bottom: 60),
      child: Center(
        child: ConstrainedBox(
          // Set max-width to ~900px so text doesn't stretch too wide on large screens
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Professional Experience"),
              const SizedBox(height: 8),
              Text(
                "My career journey architecting, automating, and operating mission-critical cloud systems.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
              ),
              const SizedBox(height: 32),
              ...PortfolioData.experience.map(
                (exp) => ExperienceItem(experience: exp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
