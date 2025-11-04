import 'dart:math';

class Question {
  final String text;
  final List<String> options;
  final String answer;
  final String difficulty;

  Question({
    required this.text,
    required this.options,
    required this.answer,
    required this.difficulty,
  });
}

List<Question> allQuestions = [
  // 🟢 Easy Dart & Flutter questions (15 questions for variety)
  Question(text: "What is the main programming language used in Flutter?", options: ["Java", "Dart", "Kotlin", "Swift"], answer: "Dart", difficulty: "easy"),
  Question(text: "Which widget is used to create a button in Flutter?", options: ["Container", "ElevatedButton", "Text", "Column"], answer: "ElevatedButton", difficulty: "easy"),
  Question(text: "What is the purpose of the build() method in Flutter?", options: ["To create UI", "To handle events", "To manage state", "To navigate"], answer: "To create UI", difficulty: "easy"),
  Question(text: "Which widget is used to display text in Flutter?", options: ["Container", "Button", "Text", "Image"], answer: "Text", difficulty: "easy"),
  Question(text: "What is a StatelessWidget in Flutter?", options: ["A widget that changes", "A widget that doesn't change", "A navigation widget", "A layout widget"], answer: "A widget that doesn't change", difficulty: "easy"),
  Question(text: "Which command is used to create a new Flutter project?", options: ["flutter new", "flutter create", "flutter init", "flutter start"], answer: "flutter create", difficulty: "easy"),
  Question(text: "What is the hot reload feature in Flutter?", options: ["Restart the app", "Update code without restart", "Debug the app", "Build the app"], answer: "Update code without restart", difficulty: "easy"),
  Question(text: "Which widget is used to create a list in Flutter?", options: ["Column", "Row", "ListView", "Container"], answer: "ListView", difficulty: "easy"),
  Question(text: "What is the main function in a Dart program?", options: ["start()", "main()", "init()", "run()"], answer: "main()", difficulty: "easy"),
  Question(text: "Which widget is used for navigation in Flutter?", options: ["Navigator", "Router", "Page", "Screen"], answer: "Navigator", difficulty: "easy"),
  Question(text: "What is a StatefulWidget in Flutter?", options: ["A widget that changes", "A widget that doesn't change", "A text widget", "A button widget"], answer: "A widget that changes", difficulty: "easy"),
  Question(text: "Which widget is used to create a column layout?", options: ["Row", "Column", "Stack", "Container"], answer: "Column", difficulty: "easy"),
  Question(text: "What is the purpose of setState() in Flutter?", options: ["To create widgets", "To update UI", "To navigate", "To build app"], answer: "To update UI", difficulty: "easy"),
  Question(text: "Which widget is used to add padding in Flutter?", options: ["Container", "Padding", "Margin", "Spacing"], answer: "Padding", difficulty: "easy"),
  Question(text: "What is the purpose of the Scaffold widget?", options: ["To create buttons", "To create a basic app structure", "To handle events", "To manage state"], answer: "To create a basic app structure", difficulty: "easy"),

  // 🔴 Hard Dart & Flutter questions (25 questions for variety)
  Question(text: "What is the difference between const and final in Dart?", options: ["No difference", "const is compile-time, final is runtime", "final is compile-time, const is runtime", "Both are the same"], answer: "const is compile-time, final is runtime", difficulty: "hard"),
  Question(text: "What is the purpose of the async/await keywords in Dart?", options: ["To create loops", "To handle asynchronous operations", "To create classes", "To handle errors"], answer: "To handle asynchronous operations", difficulty: "hard"),
  Question(text: "What is a Stream in Dart?", options: ["A sequence of events", "A single value", "A widget", "A function"], answer: "A sequence of events", difficulty: "hard"),
  Question(text: "What is the purpose of the Future class in Dart?", options: ["To represent a value that will be available later", "To create widgets", "To handle navigation", "To manage state"], answer: "To represent a value that will be available later", difficulty: "hard"),
  Question(text: "What is the difference between StatelessWidget and StatefulWidget?", options: ["No difference", "StatelessWidget can change, StatefulWidget cannot", "StatefulWidget can change, StatelessWidget cannot", "Both are the same"], answer: "StatefulWidget can change, StatelessWidget cannot", difficulty: "hard"),
  Question(text: "What is the purpose of the BuildContext in Flutter?", options: ["To build widgets", "To provide location in widget tree", "To handle events", "To manage state"], answer: "To provide location in widget tree", difficulty: "hard"),
  Question(text: "What is the purpose of the Key in Flutter widgets?", options: ["To identify widgets", "To style widgets", "To handle events", "To create animations"], answer: "To identify widgets", difficulty: "hard"),
  Question(text: "What is the purpose of the InheritedWidget in Flutter?", options: ["To inherit properties", "To pass data down the widget tree", "To create animations", "To handle navigation"], answer: "To pass data down the widget tree", difficulty: "hard"),
  Question(text: "What is the purpose of the Provider package in Flutter?", options: ["To provide state management", "To create widgets", "To handle navigation", "To manage assets"], answer: "To provide state management", difficulty: "hard"),
  Question(text: "What is the purpose of the BLoC pattern in Flutter?", options: ["To create animations", "To manage business logic and state", "To handle navigation", "To create widgets"], answer: "To manage business logic and state", difficulty: "hard"),
  Question(text: "What is the purpose of the GestureDetector widget?", options: ["To detect gestures", "To create buttons", "To handle text input", "To create layouts"], answer: "To detect gestures", difficulty: "hard"),
  Question(text: "What is the purpose of the AnimationController in Flutter?", options: ["To control animations", "To create widgets", "To handle events", "To manage state"], answer: "To control animations", difficulty: "hard"),
  Question(text: "What is the purpose of the CustomPainter in Flutter?", options: ["To create custom drawings", "To create widgets", "To handle events", "To manage state"], answer: "To create custom drawings", difficulty: "hard"),
  Question(text: "What is the purpose of the PlatformChannel in Flutter?", options: ["To communicate with native code", "To create widgets", "To handle events", "To manage state"], answer: "To communicate with native code", difficulty: "hard"),
  Question(text: "What is the purpose of the Isolate in Dart?", options: ["To run code in parallel", "To create widgets", "To handle events", "To manage state"], answer: "To run code in parallel", difficulty: "hard"),
  Question(text: "What is the purpose of the Mixin in Dart?", options: ["To share code between classes", "To create widgets", "To handle events", "To manage state"], answer: "To share code between classes", difficulty: "hard"),
  Question(text: "What is the purpose of the Extension in Dart?", options: ["To add functionality to existing classes", "To create widgets", "To handle events", "To manage state"], answer: "To add functionality to existing classes", difficulty: "hard"),
  Question(text: "What is the purpose of the Generic in Dart?", options: ["To create type-safe code", "To create widgets", "To handle events", "To manage state"], answer: "To create type-safe code", difficulty: "hard"),
  Question(text: "What is the purpose of the Null Safety in Dart?", options: ["To prevent null pointer exceptions", "To create widgets", "To handle events", "To manage state"], answer: "To prevent null pointer exceptions", difficulty: "hard"),
  Question(text: "What is the purpose of the Late keyword in Dart?", options: ["To declare variables that will be initialized later", "To create widgets", "To handle events", "To manage state"], answer: "To declare variables that will be initialized later", difficulty: "hard"),
  Question(text: "What is the purpose of the Required keyword in Dart?", options: ["To make parameters mandatory", "To create widgets", "To handle events", "To manage state"], answer: "To make parameters mandatory", difficulty: "hard"),
  Question(text: "What is the purpose of the Factory constructor in Dart?", options: ["To create instances with custom logic", "To create widgets", "To handle events", "To manage state"], answer: "To create instances with custom logic", difficulty: "hard"),
  Question(text: "What is the purpose of the Named constructor in Dart?", options: ["To create multiple ways to construct an object", "To create widgets", "To handle events", "To manage state"], answer: "To create multiple ways to construct an object", difficulty: "hard"),
  Question(text: "What is the purpose of the Const constructor in Dart?", options: ["To create compile-time constants", "To create widgets", "To handle events", "To manage state"], answer: "To create compile-time constants", difficulty: "hard"),
  Question(text: "What is the purpose of the Super keyword in Dart?", options: ["To call parent class methods", "To create widgets", "To handle events", "To manage state"], answer: "To call parent class methods", difficulty: "hard"),
];

List<Question> generateRandomQuestions(String difficulty, int count) {
  final selected = allQuestions.where((q) => q.difficulty == difficulty).toList();
  selected.shuffle(Random());
  return selected.take(count).toList();
}
