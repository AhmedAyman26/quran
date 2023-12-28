import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_cubit.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_states.dart';
import 'package:quran/mushaf/presentation/pages/listening/reader_page.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<ListeningCubit, ListeningStates>(
          builder: (context, state) {
            print(state);
            if (state is GetReadersSuccessState) {
              return ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReaderPage(
                                    identifier:
                                        state.readers?[index].identifier ?? '', reader: state.readers?[index].name??'',),
                              ));
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
                                  Text(
                                    state.readers?[index].name ?? '',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: state.readers?.length ?? 0);
            } else if (state is GetReadersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
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
                          ListeningCubit.get(context).getReaders();
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
