import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'The capital of France is Paris.',
      'answer': true,
    },
    {
      'question': 'The Great Wall of China is visible from space with the naked eye.',
      'answer': false,
    },
    {
      'question': 'The human body has four lungs.',
      'answer': false,
    },
    {
      'question': 'Venus is the hottest planet in our solar system.',
      'answer': true,
    },
    {
      'question': 'The chemical symbol for gold is Ag.',
      'answer': false, // It's Au
    },
    {
      'question': 'The Nile is the longest river in the world.',
      'answer': true,
    },
    {
      'question': 'Penguins are mammals.',
      'answer': false, // They're birds
    },
    {
      'question': 'The currency of Japan is the yen.',
      'answer': true,
    },
    {
      'question': 'Lightning never strikes the same place twice.',
      'answer': false,
    },
    {
      'question': 'The human skeleton is made up of less than 100 bones.',
      'answer': false, // About 206 bones
    },
    {
      'question': 'The Titanic sank in 1912.',
      'answer': true,
    },
    {
      'question': 'The Earth is the third planet from the sun.',
      'answer': true,
    },
    {
      'question': 'The capital of Canada is Toronto.',
      'answer': false, // It's Ottawa
    },
    {
      'question': 'Bananas grow on trees.',
      'answer': false, // They grow on herbaceous plants
    },
    {
      'question': 'The square root of 144 is 12.',
      'answer': true,
    },
  ];

  void answerQuestion(bool userAnswer) {
    bool correctAnswer = questions[currentQuestionIndex]['answer'];

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
      }

      // Move to next question or show results
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz finished - show results
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Quiz Completed!'),
                content: Text('Your score: $score/${questions.length}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        currentQuestionIndex = 0;
                        score = 0;
                      });
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('True or False Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question text
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // True button
            ElevatedButton(
              onPressed: () => answerQuestion(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('True', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),

            // False button
            ElevatedButton(
              onPressed: () => answerQuestion(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('False', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),

            // Progress indicator
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
