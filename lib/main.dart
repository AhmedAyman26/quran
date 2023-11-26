import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/di/mushaf_di.dart';
import 'package:quran/mushaf/presentation/pages/home.dart';
import 'package:quran/mushaf/presentation/pages/listening/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.white,
            primarySwatch: MaterialColor(
                Colors.white.value,
                const {}
            )
        )
      ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SurahsCubit(injector()),
            ),
            BlocProvider(
              create: (context) => ListeningCubit(injector()),
            ),
          ], child: const HomePage(),
        ));
  }
}
