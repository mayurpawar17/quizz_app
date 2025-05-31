import 'package:flutter/material.dart';
import 'package:quizz_app/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  List<Question> questionBank = [
    // Original questions
    Question(q: 'The capital of France is Paris.', a: true),
    Question(q: 'The square root of 144 is 12.', a: true),
    Question(q: 'Bananas grow on trees.', a: false),
    // They grow on herbaceous plants!

    // New general knowledge questions
    Question(q: 'The Great Wall of China is visible from space.', a: false),
    // Myth!
    Question(q: 'Venus is the hottest planet in the solar system.', a: true),
    Question(q: 'The currency of Japan is the Yuan.', a: false),
    // It’s the Yen.

    // Science questions
    Question(q: 'Water boils at 100°C at sea level.', a: true),
    Question(q: 'Humans have five senses.', a: false),
    // Technically more (e.g., balance, proprioception).
    Question(q: 'Light travels faster than sound.', a: true),

    // Geography questions
    Question(q: 'The Nile is the longest river in the world.', a: true),
    Question(q: 'Canada is the largest country by land area.', a: false),
    // Russia is larger.
    Question(q: 'Mount Everest is in the Himalayas.', a: true),

    // Fun/trivia questions
    Question(q: 'The loudest animal on Earth is the blue whale.', a: true),
    Question(q: 'Penguins can fly.', a: false),
    Question(q: 'The human body has four lungs.', a: false),
    // Only two!
  ];

  void answerQuestion(bool userAnswer) {
    // bool correctAnswer = questions[currentQuestionIndex]['answer'];
    bool correctAnswer = questionBank[currentQuestionIndex].answer;

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
      }

      // Move to next question or show results
      if (currentQuestionIndex < questionBank.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz finished - show results
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Quiz Completed!'),
                content: Text('Your score: $score/${questionBank.length}'),
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
              questionBank[currentQuestionIndex].question,
              // questions[currentQuestionIndex]['question'],
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
              'Question ${currentQuestionIndex + 1}/${questionBank.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
