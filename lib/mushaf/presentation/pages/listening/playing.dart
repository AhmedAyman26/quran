import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

class Playing extends StatefulWidget {
  final SurahModel surah;

  const Playing({Key? key, required this.surah}) : super(key: key);

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  late final AudioPlayer player;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (o) {
        player.pause();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              color: Colors.green,
              child: Text(widget.surah.name ?? ''),
            ),
            Slider(
              value: 0,
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.skip_previous)),
                IconButton(
                    onPressed: () {

                      player
                          .play(UrlSource(widget.surah.ayahs?[0].audio ?? ''));
                      int i = 1;
                      player.onPlayerComplete.listen((_) {
                        if (i < widget.surah.ayahs!.length) {
                          player.play(
                              UrlSource(widget.surah.ayahs?[i].audio ?? ''));
                          i++;
                        }
                      });
                    },
                    icon: const Icon(Icons.play_arrow_rounded)),
                IconButton(
                    onPressed: () {
                      player.pause();
                    },
                    icon: const Icon(Icons.skip_next)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
