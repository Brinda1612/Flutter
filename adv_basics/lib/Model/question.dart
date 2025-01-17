class QuestionModel {
  final String question;
  final List<String> options;
  final int correntAnsIndex;

  const QuestionModel({
    required this.question,
    required this.options,
    required this.correntAnsIndex,
  });
}

const List<QuestionModel> questions = [
  QuestionModel(
      question: '1. What is the capital of France?',
      options: [
        'A) Madrid',
        'B) Paris',
        'C) Barlin',
        'D) Rome'
      ],
      correntAnsIndex: 1
  ),
  QuestionModel(
      question: '2. What does JSON stand for?',
      options: [
        'a) Java Source Object Notation',
        'b) JavaScript Object Notation',
        'c) Java Simple Object Notation',
        'd) Java Secure Object Network',
],
      correntAnsIndex: 1
  ),
  QuestionModel(
      question: '3. Which programming language is used with Flutter?',
      options: [
        'a) Java',
        'b) Kotli',
        'c) Dart',
        'd) Python',
      ],
      correntAnsIndex: 2
  )
];
