import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_cubit.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_states.dart';

class ReaderPage extends StatefulWidget {
  final String identifier;

  const ReaderPage({Key? key, required this.identifier}) : super(key: key);

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  @override
  void initState() {
    ListeningCubit.get(context).getMushafByReader(widget.identifier);
    super.initState();
  }

  AudioPlayer player=AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ListeningCubit, ListeningStates>(
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                },
                child: Container(
                  height: 70,
                  child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.surahs?[index].name ?? '',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '،',
                                      style: TextStyle(
                                        color: Colors.black
                                            .withOpacity(0.4),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${state.surahs?[index].ayahs?.length.toString() ?? ''} آية',
                                      style: TextStyle(
                                        color: Colors.black
                                            .withOpacity(0.4),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: state.surahs?.length??0);
        },
      ),
    );
  }
}
