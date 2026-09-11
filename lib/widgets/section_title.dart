import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Determine line width proportionally to available space
          final lineWidth = constraints.maxWidth * 0.4;
          // Gradient for underline
          final gradient = LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.7),
              Theme.of(context).colorScheme.primary,
            ],
          );

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title that wraps and respects max lines
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        letterSpacing: 0.5,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 12),
              // Decorative gradient line with rounded caps
              Container(
                height: 3,
                width: lineWidth,
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
