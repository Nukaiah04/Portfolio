import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  IconData _getCategoryIcon(String category) {
    final lower = category.toLowerCase();
    if (lower.contains('cloud platforms')) return Icons.cloud_rounded;
    if (lower.contains('infrastructure') || lower.contains('security')) {
      return Icons.architecture_rounded;
    }
    if (lower.contains('container')) return Icons.layers_rounded;
    if (lower.contains('ci/cd') || lower.contains('automation')) {
      return Icons.sync_alt_rounded;
    }
    if (lower.contains('scripting')) return Icons.terminal_rounded;
    if (lower.contains('monitoring') || lower.contains('observability')) {
      return Icons.insights_rounded;
    }
    if (lower.contains('networking')) return Icons.lan_rounded;
    if (lower.contains('web') || lower.contains('database') || lower.contains('tools')) {
      return Icons.storage_rounded;
    }
    return Icons.folder_rounded;
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String category,
    List<String> skills, {
    bool fillHeight = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      height: fillHeight ? double.infinity : null,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111827) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getCategoryIcon(category),
                  size: 18,
                  color: primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  category,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1E293B)
                      : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${skills.length}",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF64748B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: skills.map((skill) => SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 120px top padding ensures ample clearance so sticky header never clips cards
    return Container(
      padding: const EdgeInsets.only(top: 120, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Technical Skills"),
          Text(
            "Hands-on cloud platforms, infrastructure as code, CI/CD automation, and observability tooling I use in production.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMultiColumn = constraints.maxWidth >= 768;

              // Row pairings designed for thematic harmony and equal visual balance
              final pairs = [
                ("Cloud Platforms (GCP)", "Containers & Orchestration"),
                ("CI/CD & DevOps Automation", "Infrastructure as Code & Security"),
                ("Scripting & Automation", "Monitoring & Observability"),
                ("Cloud Networking", "Web, Databases & Tools"),
              ];

              if (!isMultiColumn) {
                // Mobile layout: single vertical card column
                return Column(
                  children: PortfolioData.skills.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _buildCategoryCard(
                        context,
                        entry.key,
                        entry.value,
                      ),
                    );
                  }).toList(),
                );
              }

              // Desktop layout: Pairs wrapped in IntrinsicHeight for guaranteed EQUAL card heights in each row
              return Column(
                children: pairs.map((pair) {
                  final skills1 = PortfolioData.skills[pair.$1] ?? [];
                  final skills2 = PortfolioData.skills[pair.$2] ?? [];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _buildCategoryCard(
                              context,
                              pair.$1,
                              skills1,
                              fillHeight: true,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _buildCategoryCard(
                              context,
                              pair.$2,
                              skills2,
                              fillHeight: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
