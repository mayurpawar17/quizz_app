import 'package:flutter/material.dart';

import '../quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void answerQuestion(bool userAnswer) {
    // bool correctAnswer = questions[currentQuestionIndex]['answer'];
    bool correctAnswer = quizBrain.questionBank[currentQuestionIndex].answer;

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
      }

      // Move to next question or show results
      if (currentQuestionIndex < quizBrain.questionBank.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz finished - show results
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Quiz Completed!'),
                content: Text(
                  'Your score: $score/${quizBrain.questionBank.length}',
                ),
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
              quizBrain.questionBank[currentQuestionIndex].question,
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
              'Question ${currentQuestionIndex + 1}/${quizBrain.questionBank.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
