import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF0D0D0D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _DrawerHeader(),
            const SizedBox(height: 8),
            _DrawerItem(
              icon: CupertinoIcons.tv_fill,
              label: 'All Channels',
              onTap: () => Navigator.popAndPushNamed(context, '/allchannels'),
            ),
            _DrawerItem(
              icon: CupertinoIcons.info_circle_fill,
              label: 'App Info',
              onTap: () => Navigator.popAndPushNamed(context, '/settings'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(color: Colors.white12, thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 16, 8),
              child: Text(
                'MORE',
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            _DrawerItem(
              icon: CupertinoIcons.star_fill,
              label: 'Rate App',
              onTap: () {
                _rateApp();
                Navigator.of(context).pop();
              },
            ),
            _DrawerItem(
              icon: CupertinoIcons.arrowshape_turn_up_right_fill,
              label: 'Share App',
              onTap: () => Share.share(shareApp),
            ),
            _DrawerItem(
              icon: CupertinoIcons.question_circle_fill,
              label: 'Report Bug & Help',
              onTap: () {
                _reportBugHelp();
                Navigator.of(context).pop();
              },
            ),
            _DrawerItem(
              icon: Icons.exit_to_app_rounded,
              label: 'Exit',
              iconColor: Colors.redAccent,
              onTap: () => SystemNavigator.pop(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF006064), Color(0xFF00BCD4)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  CupertinoIcons.tv_fill,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Faizi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bold',
                      ),
                    ),
                    TextSpan(
                      text: ' TV',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bold',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Free Live TV Streaming',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const _DrawerItem({
    Key key,
    this.icon,
    this.label,
    this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color resolvedIconColor = iconColor ?? const Color(0xFF00BCD4);
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: resolvedIconColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: resolvedIconColor, size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        color: Colors.white24,
        size: 14,
      ),
    );
  }
}

_rateApp() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.FaiziApps.FaiziTv';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_reportBugHelp() async {
  const url = 'https://wa.me/message/XSTFUGCVDAYEO1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

const String shareApp =
    'Download Faizi TV app to watch unlimited free TV channels....\n\n'
    "Don't forget to rate app on Play store...\n"
    'https://play.google.com/store/apps/details?id=com.FaiziApps.FaiziTv';
