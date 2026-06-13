import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ten_sports/pages/home_page_rows.dart';
import 'package:ten_sports/widgets/drawer.dart';
import 'package:ten_sports/widgets/slider.dart';

final keyIsFirstLoaded = 'is_first_loaded';
final String alertDetail =
    'پہلی بار تمام چینلز کو ڈیٹا پیکج یا وائی فائی کے ساتھ چلائیں..\n پھر اس کے بعد آپ کسی بھی وقت بغیر پیکیج کے دیکھ سکتے ہیں۔\n چینلز اپڈیٹ ہونے  کے بعد بھی ایسا ہی کریں.';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.tv_fill,
                color: const Color(0xFF00BCD4),
                size: 26,
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Faizi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bold',
                      ),
                    ),
                    TextSpan(
                      text: ' TV',
                      style: TextStyle(
                        color: const Color(0xFF00BCD4),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bold',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.tv, color: Colors.white54, size: 22),
              tooltip: 'All Channels',
              onPressed: () => Navigator.pushNamed(context, '/allchannels'),
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              CarouselSlider(),
              const SizedBox(height: 12),
              _SectionHeader(title: 'Islamic'),
              IslamicChannels(),
              const SizedBox(height: 4),
              _SectionHeader(title: 'News'),
              NewsChannels(),
              const SizedBox(height: 4),
              _SectionHeader(title: 'Entertainment'),
              EntertainmentChannels(),
              const SizedBox(height: 4),
              _SectionHeader(title: 'Kids'),
              KidsChannels(),
              const SizedBox(height: 4),
              _SectionHeader(title: 'Movies'),
              MoviesChannels(),
              const SizedBox(height: 4),
              _SectionHeader(title: 'Music'),
              MusicChannels(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

showDialogIfFirstLoaded(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
  if (isFirstLoaded == null) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A2E),
          contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: const Color(0xFF00BCD4).withOpacity(0.3)),
          ),
          title: Text(
            'نوٹس  ⚠',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'bold',
              fontSize: 22.0,
              color: Colors.redAccent,
            ),
          ),
          content: Text(
            alertDetail,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'normal',
              fontSize: 18.0,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: Color(0xFF00BCD4),
                size: 32,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                prefs.setBool(keyIsFirstLoaded, false);
              },
            ),
          ],
        );
      },
    );
  }
}
