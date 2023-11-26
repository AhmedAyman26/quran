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
        appBar: AppBar(title: Text(surahName),),
        body: SafeArea(
          minimum: const EdgeInsets.all(15),
          child: ListView(children: [
              ayahs.first.text?.contains('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم')==true?Padding(
              padding: const EdgeInsets.all(5),
              child: header('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم'),
            ):const SizedBox(),
            const SizedBox(
              height: 5,
            ),

            RichText(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify ,
              text: TextSpan(

                children: [
                  for (var i = 1; i <=ayahs.length; i++) ...{
                    TextSpan(
                      text: ayahs[0].text=='بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم'?'${ayahs[i-1].text?.trim()}':'${ayahs[i-1].text?.split('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم').last}',
                      style: const TextStyle(
                        fontFamily: 'Kitab',
                        fontSize: 25,
                        color: Colors.black87,
                      ),
                      children: [
                        const WidgetSpan(
                          child: SizedBox(
                            width: 5,
                          ),
                        ),
                        TextSpan(
                          text: '\u{FD3F}${replaceArabicNumber('$i')}\u{FD3E}',
                        ),
                      ],
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
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        surahName,
        style: const TextStyle(
          fontFamily: 'Aldhabi',
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }

  return input;
}


