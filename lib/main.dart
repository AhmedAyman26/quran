import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/di/mushaf_di.dart';
import 'package:quran/mushaf/presentation/pages/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/surahs_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => SurahsCubit(injector()),
          child: const SurahsPage(),
        ));
  }
}
