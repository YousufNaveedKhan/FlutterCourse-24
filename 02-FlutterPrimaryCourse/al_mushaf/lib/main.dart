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
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Screen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset("assets/images/quran.png"),
        ),
      ),
      backgroundColor: Colors.brown[900],
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Surahs()),
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

class Surahs extends StatefulWidget {
  const Surahs({super.key});

  @override
  State<Surahs> createState() => _SurahsState();
}

class _SurahsState extends State<Surahs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surahs'),
      ),
      body: ListView.builder(
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
                    builder: (context) => DetailSurah(surahIndex)),
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
            subtitle: Text(quran.getSurahNameEnglish(surahIndex)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                revelationPlace == 'Makkah'
                    ? Image.asset('assets/images/kaaba.png',
                        width: 30, height: 30)
                    : Image.asset('assets/images/madina.png',
                        width: 30, height: 30),
                Text(
                  "Verses: $verseCount",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        },
        itemCount: quran.totalSurahCount,
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  final int index;
  const DetailSurah(this.index, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  // Updated Ayat-e-Sajdah list with correct Surah and Ayah numbers
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
    for (var entry in ayatSajdahList) {
      if (entry.containsKey(surah) && entry[surah] == ayah) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Details'),
      ),
      body: ListView.builder(
        itemCount: quran.getVerseCount(widget.index),
        itemBuilder: (context, index) {
          final verseNumber = index + 1;
          final verse =
              quran.getVerse(widget.index, verseNumber, verseEndSymbol: true);
          final isSajdah = isAyatSajdah(widget.index, verseNumber);

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
    );
  }
}

class SurahRecitation extends StatefulWidget {
  const SurahRecitation({super.key});

  @override
  State<SurahRecitation> createState() => _SurahRecitationState();
}

class _SurahRecitationState extends State<SurahRecitation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recitation'),
      ),
      body: ListView.builder(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                quran.getPlaceOfRevelation(surahIndex) == 'Makkah'
                    ? Image.asset('assets/images/kaaba.png',
                        width: 30, height: 30)
                    : Image.asset('assets/images/madina.png',
                        width: 30, height: 30),
                Text(
                  "Verses: ${quran.getVerseCount(surahIndex)}",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        },
        itemCount: quran.totalSurahCount,
      ),
    );
  }
}

class Recitation extends StatefulWidget {
  final int indexSurah;
  const Recitation(this.indexSurah, {super.key});

  @override
  State<Recitation> createState() => _RecitationState();
}

class _RecitationState extends State<Recitation> {
  final AudioPlayer audioPlayer = AudioPlayer();
  IconData playpauseButton = Icons.play_circle_fill_rounded;
  bool isPlaying = false;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> togglePlayPause() async {
    try {
      final audioUrl = await quran.getAudioURLBySurah(widget.indexSurah);
      await audioPlayer.setUrl(audioUrl);

      if (isPlaying) {
        await audioPlayer.pause();
        setState(() {
          playpauseButton = Icons.play_circle_fill_rounded;
          isPlaying = false;
        });
      } else {
        await audioPlayer.play();
        setState(() {
          playpauseButton = Icons.pause_circle_filled_rounded;
          isPlaying = true;
        });
      }
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recitation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سورۃ " + quran.getSurahNameArabic(widget.indexSurah),
            style: GoogleFonts.amiriQuran(
                textStyle: const TextStyle(fontSize: 30)),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 10),
          Center(
            child: CircleAvatar(
              backgroundColor: const Color(0xff272729),
              radius: 100,
              backgroundImage: const AssetImage("assets/images/alaffasy.png"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 49, 13, 1),
            child: Center(
              child: IconButton(
                onPressed: togglePlayPause,
                icon: Icon(playpauseButton, color: Colors.white),
                iconSize: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
