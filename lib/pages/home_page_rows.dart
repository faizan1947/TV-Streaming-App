import 'package:flutter/material.dart';

class _ChannelItem extends StatelessWidget {
  final String assetPath;
  final String label;
  final String route;

  const _ChannelItem({Key key, this.assetPath, this.label, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 82,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF00BCD4),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class IslamicChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _ChannelItem(assetPath: 'assets/madni.jpg', label: 'Madni TV', route: '/madni'),
          _ChannelItem(assetPath: 'assets/makkah.jpg', label: 'Makkah TV', route: '/makkah'),
          _ChannelItem(assetPath: 'assets/madinah.jpg', label: 'Madinah', route: '/madina'),
        ],
      ),
    );
  }
}

class NewsChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _ChannelItem(assetPath: 'assets/samaa.jpg', label: 'Samaa', route: '/samaa'),
          _ChannelItem(assetPath: 'assets/express.jpg', label: 'Express', route: '/express'),
          _ChannelItem(assetPath: 'assets/bol.jpg', label: 'BOL News', route: '/bol'),
          _ChannelItem(assetPath: 'assets/humnews.jpg', label: 'Hum News', route: '/humnews'),
          _ChannelItem(assetPath: 'assets/newsone.jpg', label: 'News One', route: '/newsone'),
          _ChannelItem(assetPath: 'assets/publicnews.jpg', label: 'Public News', route: '/publicnews'),
          _ChannelItem(assetPath: 'assets/dawn.jpg', label: 'Dawn News', route: '/dawn'),
          _ChannelItem(assetPath: 'assets/abbtakk.jpg', label: 'Abb Takk', route: '/abbtakk'),
          _ChannelItem(assetPath: 'assets/neo.jpg', label: 'Neo News', route: '/neo'),
          _ChannelItem(assetPath: 'assets/geo.jpg', label: 'Geo News', route: '/geo'),
          _ChannelItem(assetPath: 'assets/cnn.jpg', label: 'CNN', route: '/cnn'),
          _ChannelItem(assetPath: 'assets/dunya.jpg', label: 'Dunya', route: '/dunya'),
          _ChannelItem(assetPath: 'assets/aaj.jpg', label: 'Aaj News', route: '/aajnews'),
          _ChannelItem(assetPath: 'assets/gnn.jpg', label: 'GNN', route: '/gnn'),
          _ChannelItem(assetPath: 'assets/rohi.jpg', label: 'Rohi TV', route: '/rohi'),
          _ChannelItem(assetPath: 'assets/city41.jpg', label: 'City 41', route: '/city41'),
          _ChannelItem(assetPath: 'assets/city42.jpg', label: 'City 42', route: '/city42'),
          _ChannelItem(assetPath: 'assets/dw.jpg', label: 'DW', route: '/dw'),
        ],
      ),
    );
  }
}

class EntertainmentChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _ChannelItem(assetPath: 'assets/humtv.jpg', label: 'Hum TV', route: '/hum'),
          _ChannelItem(assetPath: 'assets/aplus.jpg', label: 'A Plus', route: '/aplus'),
          _ChannelItem(assetPath: 'assets/geotv.jpg', label: 'Geo TV', route: '/geoent'),
          _ChannelItem(assetPath: 'assets/ptvhome.jpg', label: 'PTV Home', route: '/ptvhome'),
          _ChannelItem(assetPath: 'assets/humsitary.jpg', label: 'Hum Sitary', route: '/humsitary'),
          _ChannelItem(assetPath: 'assets/hummasala.jpg', label: 'Hum Masala', route: '/hummasala'),
          _ChannelItem(assetPath: 'assets/expresstv.jpg', label: 'Express Ent', route: '/expressent'),
          _ChannelItem(assetPath: 'assets/urduone.jpg', label: 'Urdu 1', route: '/urdu1'),
          _ChannelItem(assetPath: 'assets/aajtv.jpg', label: 'Aaj TV', route: '/aajtv'),
          _ChannelItem(assetPath: 'assets/apnachannel.jpg', label: 'Apna Channel', route: '/apnachannel'),
          _ChannelItem(assetPath: 'assets/boltv.jpg', label: 'BOL TV', route: '/boltv'),
          _ChannelItem(assetPath: 'assets/tvone.jpg', label: 'TV One', route: '/tvone'),
          _ChannelItem(assetPath: 'assets/play.jpg', label: 'Play TV', route: '/play'),
          _ChannelItem(assetPath: 'assets/seetv.jpg', label: 'See TV', route: '/seetv'),
          _ChannelItem(assetPath: 'assets/ltn.jpg', label: 'LTN', route: '/ltn'),
          _ChannelItem(assetPath: 'assets/discovery.jpg', label: 'Discovery', route: '/discovery'),
        ],
      ),
    );
  }
}

class KidsChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _ChannelItem(assetPath: 'assets/cn.jpg', label: 'Cartoon Network', route: '/cn'),
          _ChannelItem(assetPath: 'assets/championtv.jpg', label: 'Champion TV', route: '/championtv'),
          _ChannelItem(assetPath: 'assets/discoverykids.jpg', label: 'Discovery Kids', route: '/discoverykids'),
        ],
      ),
    );
  }
}

class MoviesChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _ChannelItem(assetPath: 'assets/filmax.jpg', label: 'Fil Max', route: '/filmax'),
          _ChannelItem(assetPath: 'assets/filmworld.jpg', label: 'Film World', route: '/filmworld'),
          _ChannelItem(assetPath: 'assets/movieone.jpg', label: 'Movie One', route: '/movieone'),
        ],
      ),
    );
  }
}

class MusicChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _ChannelItem(assetPath: 'assets/8xm.jpg', label: '8XM', route: '/8xm'),
          _ChannelItem(assetPath: 'assets/jalwa.jpg', label: 'Jalwa', route: '/jalwa'),
        ],
      ),
    );
  }
}
