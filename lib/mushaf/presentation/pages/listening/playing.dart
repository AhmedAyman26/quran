import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

class Playing extends StatefulWidget {
  final SurahModel surah;
  final String reader;

  const Playing({Key? key, required this.surah, required this.reader}) : super(key: key);

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  late final AudioPlayer player;
  bool isPlaying = false;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
            child:
            Image(image: NetworkImage('https://wallpapercave.com/wp/wp11370776.jpg'),fit: BoxFit.fill,)),
        PopScope(
            onPopInvoked: (o) {
              player.pause();
            },
            child: Scaffold(
              appBar: AppBar(backgroundColor: Colors.transparent,iconTheme: const IconThemeData(color: Colors.white)),
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.black38,
                    child: Column(
                      children: [
                        Text(widget.surah.name ?? '',style: const TextStyle(color: Colors.white,fontSize: 20),),
                        Text(widget.reader ?? '',style: const TextStyle(color: Colors.white,fontSize: 14),),
                        Slider(
                          activeColor: Colors.green,
                          value: 0.1,
                          onChanged: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.skip_previous,color: Colors.white,)),
                            IconButton(
                                onPressed: () {
                                  if (!isPlaying) {
                                    player.play(
                                        UrlSource(widget.surah.ayahs?[0].audio ?? ''));
                                    int i = 1;
                                    player.onPlayerComplete.listen((_) {
                                      if (i < widget.surah.ayahs!.length) {
                                        player.play(UrlSource(
                                            widget.surah.ayahs?[i].audio ?? ''));
                                        i++;
                                      }
                                    });
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  } else {
                                    player.pause();
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  }
                                },
                                icon: Icon(isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow_rounded),color: Colors.white,),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.skip_next),color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
