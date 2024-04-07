import 'package:flutter/material.dart';
import 'package:quran/mushaf/presentation/pages/listening/all_readers_page/readers_list_Page.dart';

import '../reading/all_surahs_page/surahs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tab> tabs = [
    const Tab(
      text: 'Reading',
    ),
    const Tab(
      text: 'Listening',
    ),
  ];
  List<Widget> tabsContent = [
    const SurahPage(),
    const ReadersListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TabBar(
                tabs: tabs,
                indicatorColor: Colors.green,
                labelColor: Colors.black,
                tabAlignment: TabAlignment.fill),
            Expanded(
              child: TabBarView(
                children: tabsContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
