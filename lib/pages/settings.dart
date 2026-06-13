import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Settings extends StatefulWidget {
  Settings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'App Info',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _AppInfoHeader(),
            const SizedBox(height: 24),
            _InfoCard(
              icon: CupertinoIcons.app_badge_fill,
              label: 'App Name',
              value: _packageInfo.appName,
            ),
            _InfoCard(
              icon: CupertinoIcons.cube_box_fill,
              label: 'Package Name',
              value: _packageInfo.packageName,
            ),
            _InfoCard(
              icon: CupertinoIcons.tag_fill,
              label: 'Version',
              value: _packageInfo.version,
            ),
            _InfoCard(
              icon: CupertinoIcons.hammer_fill,
              label: 'Build Number',
              value: _packageInfo.buildNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class _AppInfoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF006064), Color(0xFF00BCD4)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              CupertinoIcons.tv_fill,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Faizi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bold',
                      ),
                    ),
                    TextSpan(
                      text: ' TV',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bold',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Free Live TV Streaming',
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({Key key, this.icon, this.label, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4).withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF00BCD4), size: 18),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value ?? 'Not set',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
