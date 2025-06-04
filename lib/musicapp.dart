import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MusicApp()));

class Song {
  final String name;
  final String imageUrl;
  final String songCount;

  Song({required this.name, required this.imageUrl, required this.songCount});
}

class MusicApp extends StatelessWidget {
  MusicApp({super.key});

  final List<Song> songs = [
    Song(name: "Arijit Singh", imageUrl: "https://i.imgur.com/QCNbOAo.jpg", songCount: "200+ songs"),
    Song(name: "Ali Zafar", imageUrl: "https://i.imgur.com/jv8KZCJ.jpg", songCount: "100+ songs"),
    Song(name: "Shreya Ghoshal", imageUrl: "https://i.imgur.com/9UgXQdQ.jpg", songCount: "150+ songs"),
    Song(name: "Neha Kakkar", imageUrl: "https://i.imgur.com/yy8qzYm.jpg", songCount: "180+ songs"),
    Song(name: "Atif Aslam", imageUrl: "https://i.imgur.com/r7eY5HT.jpg", songCount: "210+ songs"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text("Thrilling Week", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 4),
              Text("2025 top songs to hang on", style: TextStyle(fontSize: 16, color: Colors.black87)),

              const SizedBox(height: 24),
              Text("Explore", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              const SizedBox(height: 12),

              // Filter Row (Tabs style)
              Row(
                children: [
                  Text("Recommended", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 12),
                  Text("2025 songs", style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(width: 12),
                  Text("New songs", style: TextStyle(color: Colors.grey[600])),
                ],
              ),

              const SizedBox(height: 16),

              // Horizontally scrolling row of song cards
              SizedBox(
                height: 170,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: songs.map((song) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                song.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(song.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(song.songCount, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
