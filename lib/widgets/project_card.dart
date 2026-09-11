import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/skill_chip.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final tags = List<String>.from(project['tags'] ?? []);
    final mobileContrib = List<String>.from(project['mobile_contribution'] ?? []);
    final backendContrib = List<String>.from(project['backend_contribution'] ?? []);
    final bullets = List<String>.from(project['bullets'] ?? []);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  project['name'],
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: () async {
                  final url = Uri.parse(project['link']);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                tooltip: 'View Project',
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            project['duration'],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            project['description'],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) => SkillChip(label: tag)).toList(),
          ),
          if (mobileContrib.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              "Mobile Contribution:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
            const SizedBox(height: 8),
            ...mobileContrib.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 16)),
                      Expanded(child: Text(c, style: Theme.of(context).textTheme.bodyMedium)),
                    ],
                  ),
                )),
          ],
          if (backendContrib.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              "Backend Contribution:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
            const SizedBox(height: 8),
            ...backendContrib.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 16)),
                      Expanded(child: Text(c, style: Theme.of(context).textTheme.bodyMedium)),
                    ],
                  ),
                )),
          ],
          if (bullets.isNotEmpty) ...[
            const SizedBox(height: 16),
            ...bullets.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 16)),
                      Expanded(child: Text(c, style: Theme.of(context).textTheme.bodyMedium)),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }
}
