import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/presentation/pages/listening/surahs_cubit.dart';
import 'package:quran/mushaf/presentation/pages/listening/surahs_states.dart';

class ReadersListPage extends StatefulWidget {
  const ReadersListPage({Key? key}) : super(key: key);

  @override
  State<ReadersListPage> createState() => _ReadersListPageState();
}

class _ReadersListPageState extends State<ReadersListPage> {
  @override
  void initState() {
    ListeningCubit.get(context).getReaders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningCubit, ListeningStates>(
      builder: (context, state) {
        print(state.readers);
        return ListView.builder(
          itemCount: state.readers?.length,
          itemBuilder: (context, index) => Text(
            state.readers?[index].name ?? '',
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}
