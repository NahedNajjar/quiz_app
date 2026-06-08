import '../models/category.dart';
import '../models/question.dart';

class QuizData {
  static List<Category> categories = [
    Category(
      id: '1',
      title: 'Science',
      description: 'Questions about Physics, Chemistry & Biology',
      imagePath: 'assets/images/chemistry.png',
      questionCount: 3,
    ),
    Category(
      id: '2',
      title: 'History',
      description: 'Questions about World History & Civilizations',
      imagePath: 'assets/images/history-book.png',
      questionCount: 3,
    ),
    Category(
      id: '3',
      title: 'Mathematics',
      description: 'Questions about Algebra & Geometry',
      imagePath: 'assets/images/mathmatics.png',
      questionCount: 3,
    ),
  ];

  static List<Question> questions = [
    Question(
      id: '1',
      categoryId: '1',
      text: 'What is the unit of force?',
      options: ['Watt', 'Newton', 'Joule', 'Pascal'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: '2',
      categoryId: '1',
      text: 'How many elements are in the periodic table?',
      options: ['108', '98', '118', '128'],
      correctAnswerIndex: 2,
    ),
    Question(
      id: '3',
      categoryId: '1',
      text: 'What is the speed of light?',
      options: ['300,000 km/s', '150,000 km/s', '450,000 km/s', '100,000 km/s'],
      correctAnswerIndex: 0,
    ),
    Question(
      id: '4',
      categoryId: '2',
      text: 'In which year did World War II end?',
      options: ['1943', '1944', '1946', '1945'],
      correctAnswerIndex: 3,
    ),
    Question(
      id: '5',
      categoryId: '2',
      text: 'Who was the first President of the United States?',
      options: [
        'Abraham Lincoln',
        'George Washington',
        'Thomas Jefferson',
        'John Adams',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      id: '6',
      categoryId: '2',
      text: 'Where was the ancient civilization of Mesopotamia located?',
      options: ['Egypt', 'Greece', 'Iraq', 'Iran'],
      correctAnswerIndex: 2,
    ),
    Question(
      id: '7',
      categoryId: '3',
      text: 'What is the value of Pi (π) to two decimal places?',
      options: ['3.12', '3.16', '3.14', '3.18'],
      correctAnswerIndex: 2,
    ),
    Question(
      id: '8',
      categoryId: '3',
      text: 'What is the square root of 144?',
      options: ['11', '14', '13', '12'],
      correctAnswerIndex: 3,
    ),
    Question(
      id: '9',
      categoryId: '3',
      text: 'How many degrees are in a triangle?',
      options: ['90°', '360°', '180°', '270°'],
      correctAnswerIndex: 2,
    ),
  ];

  static List<Question> getQuestionsByCategory(String categoryId) {
    return questions.where((q) => q.categoryId == categoryId).toList();
  }
}
