import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../data/models/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};

  void _selectAnswer(int answerIndex) {
    setState(() => _selectedAnswers[_currentIndex] = answerIndex);
  }

  void _next(List<Question> questions) {
    if (_currentIndex < questions.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _previous() {
    if (_currentIndex > 0) setState(() => _currentIndex--);
  }

  void _submit(List<Question> questions) {
    int score = 0;
    _selectedAnswers.forEach((qIndex, aIndex) {
      if (questions[qIndex].correctAnswerIndex == aIndex) score++;
    });
    Navigator.pushReplacementNamed(
      context,
      '/result',
      arguments: {'score': score, 'total': questions.length},
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions =
        ModalRoute.of(context)!.settings.arguments as List<Question>;

    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textLight,
        ),
        body: const Center(child: Text('No questions in this category')),
      );
    }

    final question = questions[_currentIndex];
    final isLast = _currentIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentIndex + 1} of ${questions.length}'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / questions.length,
              backgroundColor: AppColors.primary.withOpacity(0.2),
              color: AppColors.primary,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                question.text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedAnswers[_currentIndex] == index;
                  return GestureDetector(
                    onTap: () => _selectAnswer(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.primary,
                            ),
                            child: Center(
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              question.options[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.white : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                if (_currentIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _previous,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Previous'),
                    ),
                  ),
                if (_currentIndex > 0) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectedAnswers[_currentIndex] == null
                        ? null
                        : isLast
                        ? () => _submit(questions)
                        : () => _next(questions),
                    child: Text(isLast ? 'Submit' : 'Next'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
