import 'package:flutter/material.dart';

void main() {
  runApp(const LyricsApp());
}

class LyricsApp extends StatelessWidget {
  const LyricsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrics App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LyricsPage(),
    );
  }
}

class LyricsPage extends StatelessWidget {
  const LyricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Imagine - John Lennon"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            // Judul Lagu di tengah
            Center(
              child: Text(
                "Imagine",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4),

            // Penyanyi di kanan
            Align(
              child: Text(
                "by John Lennon",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            // Lirik panjang rata kanan
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                """Imagine there's no heaven
                It's easy if you try
                No hell below us
                Above us, only sky
                Imagine all the people
                Living for today... ah

                Imagine there's no countries
                It isn't hard to do
                Nothing to kill or die for
                And no religion too
                Imagine all the people
                Living life in peace... you...

                You may say I'm a dreamer
                But I'm not the only one
                I hope someday you'll join us
                And the world will be as one
                """,
                style: TextStyle(
                  fontSize: 22, // perbesar teks lirik
                  height: 1.6,
                ),
                textAlign: TextAlign.right, // rata kanan
              ),
            ),
          ],
        ),
      ),
    );
  }
}
