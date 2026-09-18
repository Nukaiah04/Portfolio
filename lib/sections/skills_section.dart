import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  IconData _getCategoryIcon(String category) {
    final lower = category.toLowerCase();
    if (lower.contains('cloud')) return Icons.cloud_rounded;
    if (lower.contains('infrastructure')) return Icons.architecture_rounded;
    if (lower.contains('container')) return Icons.layers_rounded;
    if (lower.contains('ci/cd')) return Icons.sync_alt_rounded;
    if (lower.contains('version')) return Icons.alt_route_rounded;
    if (lower.contains('operating') || lower.contains('scripting')) {
      return Icons.terminal_rounded;
    }
    if (lower.contains('quality') || lower.contains('security')) {
      return Icons.shield_rounded;
    }
    if (lower.contains('monitoring')) return Icons.insights_rounded;
    if (lower.contains('web') || lower.contains('database')) {
      return Icons.storage_rounded;
    }
    if (lower.contains('networking')) return Icons.lan_rounded;
    if (lower.contains('tools')) return Icons.handyman_rounded;
    return Icons.folder_rounded;
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String category,
    List<String> skills,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
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
                        fontSize: 17,
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
          const SizedBox(height: 16),
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
    // 90px top padding ensures the section has ample clearance from the sticky 70px navbar
    return Container(
      padding: const EdgeInsets.only(top: 90, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Technical Skills"),
          Text(
            "Technologies, cloud platforms, and DevOps tooling I use to architect, automate, and monitor production systems.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMultiColumn = constraints.maxWidth >= 768;

              // Divide categories evenly to fill the screen across columns without empty space
              if (!isMultiColumn) {
                // Mobile single-column
                return Column(
                  children: PortfolioData.skills.entries.map((entry) {
                    return _buildCategoryCard(
                      context,
                      entry.key,
                      entry.value,
                    );
                  }).toList(),
                );
              }

              // Multi-column balanced grid
              final entries = PortfolioData.skills.entries.toList();
              final col1Entries = <MapEntry<String, List<String>>>[];
              final col2Entries = <MapEntry<String, List<String>>>[];

              // Distribute logically:
              // Left: Cloud, Containers, IaC, CI/CD, Version Control, Tools
              // Right: Networking, Monitoring, OS/Scripting, Security, Web/DB
              final col1Keys = {
                "Cloud (GCP)",
                "Containers & Orchestration",
                "Infrastructure as Code",
                "CI/CD",
                "Version Control",
                "Development Tools",
              };

              for (var entry in entries) {
                if (col1Keys.contains(entry.key)) {
                  col1Entries.add(entry);
                } else {
                  col2Entries.add(entry);
                }
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: col1Entries.map((entry) {
                        return _buildCategoryCard(
                          context,
                          entry.key,
                          entry.value,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: col2Entries.map((entry) {
                        return _buildCategoryCard(
                          context,
                          entry.key,
                          entry.value,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
