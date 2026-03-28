import 'package:flutter/material.dart';
import 'results_page.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  bool isRecording = false;
  bool isPlaying = false; // NEW STATE

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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mic, color: Colors.red, size: 20),
            const SizedBox(width: 8),
            Text(
              "Voice Recording",
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          /// WAVEFORM
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomPaint(
              size: const Size(double.infinity, 200),
              painter: WaveformPainter(),
            ),
          ),

          const SizedBox(height: 40),

          /// LYRICS BOX
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildLyricLine("Nag-iisa at hindi mapakali", true),
                    _buildLyricLine(
                      "Bangung-bangung pakiramdam sa aking tabi",
                      false,
                    ),
                    _buildLyricLine(
                      "Pinipilit kong limutin ka ngunit di magawa",
                      false,
                    ),
                    _buildLyricLine(
                      "Sa bawat kong galaw ay laging hanap ka",
                      false,
                    ),
                    const SizedBox(height: 20),
                    _buildLyricLine("Nag-iisa ang isang kagaya mo", false),
                    _buildLyricLine(
                      "Na nagmamahal at nagtitiwala sa isang katulad ko",
                      false,
                    ),
                    _buildLyricLine(
                      "Dahil nga ba di ko man lang nabigyan ng halaga?",
                      false,
                    ),
                    _buildLyricLine("Nagsisisi ngayong wala ka na", false),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// CONTROL BUTTONS
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// PREVIOUS
                IconButton(
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),

                const SizedBox(width: 20),

                /// PLAY / PAUSE
                IconButton(
                  icon: Icon(
                    isRecording ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      isRecording = !isRecording;
                    });
                  },
                ),

                const SizedBox(width: 20),

                /// MIC BUTTON
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                ),

                const SizedBox(width: 20),

                /// SECOND PLAY BUTTON (UPDATED)
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResultsPage(),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 20),

                /// FINISH BUTTON
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00E5FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultsPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Finish",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLyricLine(String text, bool isCurrent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          color: isCurrent ? Colors.white : Colors.grey[600],
          fontSize: 14,
          fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// WAVEFORM PAINTER

class WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00E5FF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final centerY = size.height / 2;

    for (double x = 0; x < size.width; x += 5) {
      final amplitude = 20 + (x % 100) / 5;
      final y = centerY + amplitude * (x % 10 > 5 ? 1 : -1);

      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
