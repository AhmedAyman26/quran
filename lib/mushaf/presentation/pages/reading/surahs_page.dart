import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/presentation/pages/reading/ayahs_page.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_states.dart';

class SurahsPage extends StatefulWidget {
  const SurahsPage({Key? key}) : super(key: key);

  @override
  State<SurahsPage> createState() => _SurahsPageState();
}

class _SurahsPageState extends State<SurahsPage> {
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
            return ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AyahsPage(
                                    surahName: state.surahs[index].name ?? "",
                                    ayahs: state.surahs[index].ayahs ?? [])));
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.surahs[index].name ?? '',
                                        style: TextStyle(color: Colors.black),
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
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '،',
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${replaceArabicNumber(state.surahs[index].ayahs?.length.toString() ?? '')} آية',
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
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
                itemCount: state.surahs.length);
          },
        ),
      ),
    );
  }
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
  if (revelationType == 'Meccan')
    return 'مكية';
  else {
    return 'مدنية';
  }
}
