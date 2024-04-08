import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/di/mushaf_di.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_cubit.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_states.dart';

class PlayingPage extends StatelessWidget {
  final SurahModel surah;
  final String readerName;
  final String readerIdentifier;

  const PlayingPage(
      {super.key,
      required this.surah,
      required this.readerName,
      required this.readerIdentifier});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListeningCubit(injector(), injector(), injector())
        ..getSurahAudio(surah: surah, readerIdentifier: readerIdentifier),
      child: PlayingPageBody(
        surah: surah,
        readerName: readerName,
      ),
    );
  }
}

class PlayingPageBody extends StatefulWidget {
  final SurahModel surah;
  final String readerName;

  const PlayingPageBody({
    Key? key,
    required this.surah,
    required this.readerName,
  }) : super(key: key);

  @override
  State<PlayingPageBody> createState() => _PlayingPageBodyState();
}

class _PlayingPageBodyState extends State<PlayingPageBody> {
  late final AudioPlayer player;
  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    player = AudioPlayer();
    player.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.playing;
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
            child: Image(
          image: NetworkImage('https://wallpapercave.com/wp/wp11370776.jpg'),
          fit: BoxFit.fill,
        )),
        PopScope(
            onPopInvoked: (o) {
              player.pause();
            },
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.white)),
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.black38,
                    child: Column(
                      children: [
                        Text(
                          widget.surah.name ?? '',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          widget.readerName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                        Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          activeColor: Colors.green,
                          onChanged: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await player.seek(position);
                          },
                        ),
                        duration!=Duration.zero ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(formatTime(position),style: TextStyle(color: Colors.white),),
                              Text(formatTime(duration-position),style:TextStyle(color: Colors.white)),
                            ],
                          ),
                        ): const SizedBox(),
                        BlocBuilder<ListeningCubit, ListeningStates>(
                          builder: (context, state) {
                            if (state is ListeningSuccessState &&
                                state.surahAudioUrl != null) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.skip_previous,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                    onPressed: () {
                                      if (!isPlaying) {
                                        player.play(UrlSource(
                                            state.surahAudioUrl ?? ''));
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
                                        : Icons.play_arrow_rounded),
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.skip_next),
                                    color: Colors.white,
                                  ),
                                ],
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          },
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

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if(duration.inHours > 0) hours,
    minutes,
    seconds
  ].join(':');
}