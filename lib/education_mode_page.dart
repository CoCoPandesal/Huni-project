import 'package:flutter/material.dart';
import 'voice_classification_page.dart';
import 'solfege_pitch_page.dart';

class EducationModePage extends StatelessWidget {
  const EducationModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.school,
                size: 80,
                color: Color(0xFF00E5FF),
              ),
              const SizedBox(height: 16),
              const Text(
                "EDUCATION MODE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              _buildEducationButton(
                context,
                "Voice Classification",
                "Matching System",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoiceClassificationPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildEducationButton(
                context,
                "Solfege Pitch",
                "Pitch Matching System",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SolfegePitchPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationButton(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
