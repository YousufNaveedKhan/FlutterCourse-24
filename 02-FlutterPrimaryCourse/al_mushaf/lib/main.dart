import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/quran.png"),
      ),
      backgroundColor: Colors.brown[900],
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SurahList()),
                );
              },
              child: const Text("Quran"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SurahRecitation()),
                );
              },
              child: const Text("Recitation"),
            ),
          ],
        ),
      ),
    );
  }
}

class SurahList extends StatelessWidget {
  const SurahList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
          final surahIndex = index + 1;
          final surahName = quran.getSurahName(surahIndex);
          final surahNameArabic = quran.getSurahNameArabic(surahIndex);
          final revelationPlace = quran.getPlaceOfRevelation(surahIndex);
          final verseCount = quran.getVerseCount(surahIndex);

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SurahDetail(surahIndex)),
              );
            },
            leading: CircleAvatar(
              backgroundColor: Colors.brown[900],
              child: Text(
                "$surahIndex",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              "$surahName | $surahNameArabic",
              style: GoogleFonts.amiriQuran(), // Ensure the font is available
            ),
            subtitle: Text(quran.getSurahNameEnglish(surahIndex)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                revelationPlace == 'Makkah'
                    ? Image.asset('assets/images/kaaba.png',
                        width: 30, height: 30)
                    : Image.asset('assets/images/madina.png',
                        width: 30, height: 30),
                Text("Verses: $verseCount",
                    style: const TextStyle(fontSize: 10)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class SurahDetail extends StatelessWidget {
  final int surahIndex;
  SurahDetail(this.surahIndex, {super.key}); // Remove 'const' here

  final List<Map<int, int>> ayatSajdahList = [
    {7: 206},
    {13: 15},
    {16: 26},
    {17: 109},
    {19: 58},
    {22: 18},
    {22: 77},
    {23: 109},
    {24: 41},
    {25: 60},
    {27: 60},
    {32: 15},
    {38: 24},
    {84: 21}
  ];

  bool isAyatSajdah(int surah, int ayah) {
    return ayatSajdahList
        .any((entry) => entry.containsKey(surah) && entry[surah] == ayah);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.getVerseCount(surahIndex),
        itemBuilder: (context, index) {
          final verseNumber = index + 1;
          final verse =
              quran.getVerse(surahIndex, verseNumber, verseEndSymbol: true);
          final isSajdah = isAyatSajdah(surahIndex, verseNumber);

          return ListTile(
            title: Text(
              verse,
              textAlign: TextAlign.right,
              style: GoogleFonts.amiriQuran(
                color: isSajdah ? Colors.red : Colors.black,
              ),
            ),
            tileColor: isSajdah ? Colors.yellow.shade100 : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class SurahRecitation extends StatelessWidget {
  const SurahRecitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
          final surahIndex = index + 1;
          final surahName = quran.getSurahName(surahIndex);
          final surahNameArabic = quran.getSurahNameArabic(surahIndex);

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Recitation(surahIndex)),
              );
            },
            leading: CircleAvatar(
              backgroundColor: Colors.brown[900],
              child: Text(
                "$surahIndex",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              "$surahName | $surahNameArabic",
              style: GoogleFonts.amiriQuran(),
            ),
            subtitle: Text(
              "مشاري بن راشد العفاسي",
              style: GoogleFonts.amiriQuran(
                textStyle: TextStyle(color: Colors.brown[800]),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                quran.getPlaceOfRevelation(surahIndex) == 'Makkah'
                    ? Image.asset('assets/images/kaaba.png',
                        width: 30, height: 30)
                    : Image.asset('assets/images/madina.png',
                        width: 30, height: 30),
                Text("Verses: ${quran.getVerseCount(surahIndex)}",
                    style: const TextStyle(fontSize: 10)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class Recitation extends StatefulWidget {
  final int surahIndex;
  const Recitation(this.surahIndex, {super.key});

  @override
  State<Recitation> createState() => _RecitationState();
}

class _RecitationState extends State<Recitation> {
  final AudioPlayer audioPlayer = AudioPlayer();
  IconData playPauseButton = Icons.play_circle_fill_rounded;
  bool isPlaying = false;
  int? currentVerse;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playVerse(int verseNumber) async {
    try {
      final audioUrl =
          await quran.getAudioURLByVerse(widget.surahIndex, verseNumber);
      await audioPlayer.setUrl(audioUrl);
      await audioPlayer.play();
      setState(() {
        playPauseButton = Icons.pause_circle_filled_rounded;
        isPlaying = true;
        currentVerse = verseNumber;
      });
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  Future<void> togglePlayPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        playPauseButton = Icons.play_circle_fill_rounded;
        isPlaying = false;
      });
    } else if (currentVerse != null) {
      await audioPlayer.play();
      setState(() {
        playPauseButton = Icons.pause_circle_filled_rounded;
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.getVerseCount(widget.surahIndex),
        itemBuilder: (context, index) {
          final verseNumber = index + 1;
          final verse = quran.getVerse(widget.surahIndex, verseNumber,
              verseEndSymbol: true);

          return ListTile(
            title: Text(
              verse,
              textAlign: TextAlign.right,
              style: GoogleFonts.amiriQuran(),
            ),
            onTap: () {
              playVerse(verseNumber);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePlayPause,
        child: Icon(playPauseButton, color: Colors.white),
      ),
    );
  }
}
