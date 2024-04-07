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

  const PlayingPage({super.key,
    required this.surah,
    required this.readerName,
    required this.readerIdentifier
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ListeningCubit(injector(), injector(), injector())
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

  const PlayingPageBody({Key? key, required this.surah, required this.readerName,})
      : super(key: key);

  @override
  State<PlayingPageBody> createState() => _PlayingPageBodyState();
}

class _PlayingPageBodyState extends State<PlayingPageBody> {
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
            child: Image(
              image: NetworkImage(
                  'https://wallpapercave.com/wp/wp11370776.jpg'),
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
                        //                     Slider(
                        //                       label: player.().toString(),
                        //                       activeColor: Colors.green,
                        //                       value: 0.1,
                        //                       onChanged: (value)
                        // {
                        //   player.seek(position)
                        // },
                        //                     ),
                        BlocBuilder<ListeningCubit, ListeningStates>(
                          builder: (context, state) {
                            if(state is ListeningSuccessState && state.surahAudioUrl != null) {
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
                                        player
                                            .play(
                                            UrlSource(
                                                state.surahAudioUrl ?? ''))
                                            .then((value) =>
                                            player.getDuration());
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
                            return const Center(child: CircularProgressIndicator());
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
