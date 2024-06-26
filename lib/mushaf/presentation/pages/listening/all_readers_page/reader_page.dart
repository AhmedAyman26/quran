import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/di/mushaf_di.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_cubit.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_states.dart';
import 'package:quran/mushaf/presentation/pages/listening/playing_page/playing.dart';

class ReaderPage extends StatelessWidget {
  final String readerIdentifier;
  final String readerName;

  const ReaderPage({Key? key, required this.readerIdentifier, required this.readerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListeningCubit(injector(), injector(),injector()),
      child: ReaderPageBody(readerIdentifier: readerIdentifier,readerName: readerName),);
  }
}

class ReaderPageBody extends StatefulWidget {

  final String readerIdentifier;
  final String readerName;

  const ReaderPageBody({Key? key, required this.readerIdentifier, required this.readerName}) : super(key: key);

  @override
  State<ReaderPageBody> createState() => _ReaderPageBodyState();
}

class _ReaderPageBodyState extends State<ReaderPageBody> {
  @override
  void initState() {
    ListeningCubit.get(context).getMushafByReader(widget.readerIdentifier);
    super.initState();
  }

  bool isPlayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.readerName),
      ),
      body: BlocBuilder<ListeningCubit, ListeningStates>(
        builder: (context, state) {
          if (state is ListeningSuccessState) {
            return ListView.separated(
                itemBuilder: (context, index) =>
                    Column(
                      children: [
                        InkWell(
                          onTap: () async
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PlayingPage(surah: state.surahs?[index]??const SurahModel(), readerIdentifier: widget.readerIdentifier,readerName: widget.readerName,)));
                          },
                          child: SizedBox(
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
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '،',
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${state.surahs?[index].ayahs
                                                    ?.length.toString() ??
                                                    ''} آية',
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
                      ],
                    ),
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 10,
                ),
                itemCount: state.surahs?.length ?? 0);
          }
          else if (state is ListeningErrorState) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No internet connection'),
                  MaterialButton(
                      color: Colors.green,
                      child: const Text('Retry'),
                      onPressed: () {
                        ListeningCubit.get(context).getMushafByReader(
                            widget.readerIdentifier);
                      })
                ],
              ),
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green,),);
          }
        },
      ),
    );
  }
}
