import 'package:flutter/material.dart';

class SolfegePitchPage extends StatefulWidget {
  const SolfegePitchPage({super.key});

  @override
  State<SolfegePitchPage> createState() => _SolfegePitchPageState();
}

class _SolfegePitchPageState extends State<SolfegePitchPage> {
  String currentNote = "do";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            const Icon(Icons.school, color: Color(0xFF00E5FF), size: 30),
            const SizedBox(height: 4),
            const Text(
              "Solfege Pitch",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                currentNote,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              final notes = ["do", "re", "mi", "fa", "sol", "la", "ti"];
              final currentIndex = notes.indexOf(currentNote);
              setState(() {
                currentNote = notes[(currentIndex + 1) % notes.length];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00E5FF),
              foregroundColor: Colors.black,
              minimumSize: const Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Next"),
          ),
          const SizedBox(height: 30),
          const Text(
            "Details",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                _buildDetailBox("Accuracy"),
                const SizedBox(height: 10),
                _buildDetailBox("User Range"),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[800]!, width: 2),
                ),
                child: const Icon(Icons.mic, color: Colors.white, size: 35),
              ),
              const SizedBox(height: 8),
              const Text(
                "Record",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 4),
              const Text(
                "Tap to start recording",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildDetailBox(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white70)),
    );
  }
}
