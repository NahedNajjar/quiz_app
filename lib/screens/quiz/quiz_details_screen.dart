import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../data/models/category.dart';
import '../../data/local/quiz_data.dart';

class QuizDetailsScreen extends StatelessWidget {
  const QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                category.imagePath,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.quiz_rounded,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              category.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              category.description,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 16),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _InfoItem(
                    icon: Icons.help_outline,
                    label: 'Questions',
                    value: '${category.questionCount}',
                  ),
                  _InfoItem(
                    icon: Icons.timer_outlined,
                    label: 'Time',
                    value: 'No limit',
                  ),
                  _InfoItem(
                    icon: Icons.star_outline,
                    label: 'Level',
                    value: 'Medium',
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final questions = QuizData.getQuestionsByCategory(category.id);
                Navigator.pushNamed(context, '/quiz', arguments: questions);
              },
              child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
        ),
      ],
    );
  }
}
