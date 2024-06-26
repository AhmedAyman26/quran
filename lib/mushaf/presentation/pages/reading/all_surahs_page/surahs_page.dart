import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/di/mushaf_di.dart';
import 'package:quran/mushaf/presentation/pages/reading/all_surahs_page/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/reading/all_surahs_page/surahs_states.dart';
import 'package:quran/mushaf/presentation/pages/reading/reading_page.dart';
import 'package:shimmer/shimmer.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => SurahsCubit(injector()),child: const SurahPageBody(),);
  }
}

class SurahPageBody extends StatefulWidget {
  const SurahPageBody({Key? key}) : super(key: key);

  @override
  State<SurahPageBody> createState() => _SurahPageBodyState();
}

class _SurahPageBodyState extends State<SurahPageBody> {
  @override
  void initState() {
    SurahsCubit.get(context).getSurahs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<SurahsCubit, SurahsStates>(
          builder: (context, state) {
            if (state is SurahsSuccessState) {
              return ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              SlideAnimation(
                                  page: AyahsPage(
                                surahName: state.surahs[index].name ?? '',
                                ayahs: state.surahs[index].ayahs ?? [],
                              )));
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
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 18,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Text(
                                          replaceArabicNumber('${index + 1}')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.surahs[index].name ?? '',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              replaceRevelationType(state
                                                      .surahs[index]
                                                      .revelationType ??
                                                  ''),
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                              ),
                                            ),
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
                                              '${replaceArabicNumber(state.surahs[index].ayahs?.length.toString() ?? '')} آية',
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
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: state.surahs.length);
            } else if (state is SurahsLoadingState) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const SizedBox(
                        height: 70,
                        child: Card(
                          color: Colors.green,

                        ),
                      );
                    },
                  ));
            } else {
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
                          SurahsCubit.get(context).getSurahs();
                        })
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class SlideAnimation extends PageRouteBuilder {
  final Widget page;

  SlideAnimation({required this.page})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (context, animation, animationTwo, child) {
              var begin = const Offset(0, 1);
              var end = const Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            });
}

String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }

  return input;
}

String replaceRevelationType(String revelationType) {
  if (revelationType == 'Meccan') {
    return 'مكية';
  } else {
    return 'مدنية';
  }
}
