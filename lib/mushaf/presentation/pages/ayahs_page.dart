import 'package:flutter/material.dart';
import 'package:quran/mushaf/domain/models/ayah_model.dart';

class AyahsPage extends StatelessWidget {
  final List<AyahModel> ayahs;
  final String surahName;
  const AyahsPage({Key? key, required this.ayahs, required this.surahName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          minimum: EdgeInsets.all(15),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: header(surahName),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              textAlign: TextAlign.justify ,
              text: TextSpan(
                children: [
                  for (var i = 1; i <= ayahs.length; i++) ...{
                    TextSpan(
                      children: [
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: CircleAvatar(
                              child: Text(
                                '$i',
                                textAlign: TextAlign.center,
                              ),
                              radius: 14,
                            ))
                      ],
                      text: ' ${ayahs[i-1].text} ',
                      style: TextStyle(
                        fontFamily: 'Kitab',
                        fontSize: 25,
                        color: Colors.black87,
                      ),
                    ),

                  }
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
Widget header(String surahName) {
  return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            surahName,
            style: TextStyle(
              fontFamily: 'Aldhabi',
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ));
}

