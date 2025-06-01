import 'package:quizz_app/questions.dart';

class QuizBrain {
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
}
