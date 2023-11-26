import 'package:flutter/material.dart';
import 'package:quran/mushaf/presentation/pages/listening/readers_list_Page.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tab> tabs = [
    Tab(
      text: 'Reading',
    ),
    Tab(
      text:'Listening',
    ),
  ];
  List<Widget> tabsContent = [
   SurahsPage(),
   ReadersListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TabBar(tabs: tabs,labelColor: Colors.black,dividerColor: Colors.green,tabAlignment: TabAlignment.fill),
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
