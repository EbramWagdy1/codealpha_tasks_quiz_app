import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _scaleController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  double get percentage => (widget.score / widget.total) * 100;

  String get performanceText {
    if (percentage >= 90) return "Outstanding! 🌟";
    if (percentage >= 80) return "Excellent! 🎉";
    if (percentage >= 70) return "Good Job! 👍";
    if (percentage >= 60) return "Not Bad! 😊";
    return "Keep Trying! 💪";
  }

  Color get performanceColor {
    if (percentage >= 90) return const Color(0xFF10B981); // Emerald
    if (percentage >= 80) return const Color(0xFF6366F1); // Indigo
    if (percentage >= 70) return const Color(0xFFF59E0B); // Amber
    if (percentage >= 60) return const Color(0xFFEC4899); // Pink
    return const Color(0xFFEF4444); // Red
  }

  IconData get performanceIcon {
    if (percentage >= 90) return Icons.emoji_events;
    if (percentage >= 80) return Icons.star;
    if (percentage >= 70) return Icons.thumb_up;
    if (percentage >= 60) return Icons.sentiment_satisfied;
    return Icons.sentiment_dissatisfied;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // ignore: deprecated_member_use
              performanceColor.withOpacity(0.1),
              const Color(0xFFF8FAFC),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Result Icon
                      AnimatedBuilder(
                        animation: _scaleAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: performanceColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  // ignore: deprecated_member_use
                                  color: performanceColor.withOpacity(0.3),
                                  width: 3,
                                ),
                              ),
                              child: Icon(
                                performanceIcon,
                                size: 60,
                                color: performanceColor,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),

                      // Performance Text
                      AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: Text(
                              performanceText,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: performanceColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Score Card
                      AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white,
                                      // ignore: deprecated_member_use
                                      performanceColor.withOpacity(0.05),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Your Score",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${widget.score} / ${widget.total}",
                                      style: const TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1E293B),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        // ignore: deprecated_member_use
                                        color: performanceColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "${percentage.toStringAsFixed(0)}%",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: performanceColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),

                      // Performance Message
                      AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  // ignore: deprecated_member_use
                                  color: performanceColor.withOpacity(0.2),
                                ),
                              ),
                              child: Text(
                                _getPerformanceMessage(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Action Buttons
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/difficulty');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                "New Quiz",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF6366F1),
                                side: const BorderSide(
                                  color: Color(0xFF6366F1),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                "Back to Home",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getPerformanceMessage() {
    if (percentage >= 90) {
      return "Congratulations! You're a quiz master! Your knowledge is truly impressive. Keep up the excellent work!";
    } else if (percentage >= 80) {
      return "Well done! You have a solid understanding of the topics. A few more questions and you'll be perfect!";
    } else if (percentage >= 70) {
      return "Good job! You're on the right track. With a bit more practice, you'll improve even more!";
    } else if (percentage >= 60) {
      return "Not bad! You're making progress. Keep learning and you'll see improvement in no time!";
    } else {
      return "Don't give up! Every expert was once a beginner. Keep practicing and you'll get better!";
    }
  }
}
