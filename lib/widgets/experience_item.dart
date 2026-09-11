import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final Map<String, dynamic> experience;

  const ExperienceItem({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final bullets = List<String>.from(experience['bullets'] ?? []);

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line indicator could go here. Keeping it simple for now.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience['role'],
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 16,
                  children: [
                    Text(
                      experience['company'],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      experience['location'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      experience['duration'],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...bullets.map((bullet) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_right,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              bullet,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
