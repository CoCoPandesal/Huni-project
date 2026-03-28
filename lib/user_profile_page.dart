import 'package:flutter/material.dart';
import 'recently_deleted_page.dart';
import 'recording_page.dart';
import 'saved_music_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00E5FF), width: 3),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://tse1.mm.bing.net/th/id/OIP.pbRd29lKf-GB1P3-6XnAcQHaLG?rs=1&pid=ImgDetMain&o=7&rm=3 ",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "ID: 02000352497",
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(height: 4),
              const Text(
                "Yasmin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildMenuButton(
                context,
                "Records",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecordsPage()),
                ),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                "Saved Music",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedMusicPage(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                "Recently Deleted",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecentlyDeletedPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
