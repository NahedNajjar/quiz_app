import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int score = args['score'];
    final int total = args['total'];
    final double percentage = total > 0 ? (score / total) * 100 : 0;

    final color = percentage >= 70
        ? AppColors.success
        : percentage >= 40
        ? Colors.orange
        : AppColors.error;

    final message = percentage >= 70
        ? 'Excellent! 🎉'
        : percentage >= 40
        ? 'Good! Keep it up 💪'
        : 'Try again 📚';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.1),
                  border: Border.all(color: color, width: 4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$score/$total',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: TextStyle(color: color, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              message,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'You answered $score out of $total correctly',
              style: const TextStyle(color: AppColors.textGrey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (route) => false,
                );
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
