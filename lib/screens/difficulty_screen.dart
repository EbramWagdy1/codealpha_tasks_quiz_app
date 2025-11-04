import 'package:flutter/material.dart';

class DifficultyScreen extends StatefulWidget {
  const DifficultyScreen({super.key});

  @override
  State<DifficultyScreen> createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  void startQuiz(String difficulty) {
    Navigator.pushNamed(
      context,
      '/quiz',
      arguments: {
        'difficulty': difficulty,
        'count': difficulty == 'easy' ? 10 : 20, 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFE2E8F0),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.quiz,
                      size: 80,
                      color: Color(0xFF6366F1),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Choose Quiz Type",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Select between Easy or Hard Quiz",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Easy Quiz Card
                      _buildQuizCard(
                        'easy',
                        'Easy Quiz',
                        '10 Questions for Beginners',
                        'Perfect for getting started',
                        Icons.emoji_emotions,
                        const Color(0xFF10B981),
                        '10',
                      ),
                      const SizedBox(height: 24),
                      
                      // Hard Quiz Card
                      _buildQuizCard(
                        'hard',
                        'Hard Quiz',
                        '20 Questions for Experts',
                        'Test your advanced knowledge',
                        Icons.psychology,
                        const Color(0xFFEF4444),
                        '20',
                      ),
                      const SizedBox(height: 20), // Extra space at bottom
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(
    String difficulty,
    String title,
    String subtitle,
    String description,
    IconData icon,
    Color color,
    String questionCount,
  ) {
    return GestureDetector(
      onTap: () => startQuiz(difficulty),
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  // ignore: deprecated_member_use
                  color.withOpacity(0.05),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon and Question Count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: color.withOpacity(0.1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            // ignore: deprecated_member_use
                            color: color.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          icon,
                          size: 35,
                          color: color,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          '$questionCount Questions',
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  
                  // Subtitle
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  
                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  
                  // Start Button
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => startQuiz(difficulty),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Start Quiz",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
