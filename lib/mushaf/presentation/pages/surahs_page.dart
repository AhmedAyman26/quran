import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/presentation/pages/ayahs_page.dart';
import 'package:quran/mushaf/presentation/pages/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/surahs_states.dart';

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
                                  surahName: state.surahs[index].name??"",
                                    ayahs: state.surahs[index].ayahs ?? [])));
                      },
                      child: Card(
                          color: Colors.red,
                          child: Text(
                            state.surahs[index].name ?? '',
                            style: TextStyle(color: Colors.white),
                          )),
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
