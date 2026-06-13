import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _ChannelData {
  final String asset;
  final String route;
  final String name;

  const _ChannelData(this.asset, this.route, this.name);
}

const _islamic = [
  _ChannelData('assets/madni.jpg', '/madni', 'Madni TV'),
  _ChannelData('assets/makkah.jpg', '/makkah', 'Makkah TV'),
  _ChannelData('assets/madinah.jpg', '/madina', 'Madinah TV'),
];

const _news = [
  _ChannelData('assets/samaa.jpg', '/samaa', 'Samaa'),
  _ChannelData('assets/express.jpg', '/express', 'Express News'),
  _ChannelData('assets/bol.jpg', '/bol', 'BOL News'),
  _ChannelData('assets/humnews.jpg', '/humnews', 'Hum News'),
  _ChannelData('assets/newsone.jpg', '/newsone', 'News One'),
  _ChannelData('assets/publicnews.jpg', '/publicnews', 'Public News'),
  _ChannelData('assets/dawn.jpg', '/dawn', 'Dawn News'),
  _ChannelData('assets/abbtakk.jpg', '/abbtakk', 'Abb Takk'),
  _ChannelData('assets/neo.jpg', '/neo', 'Neo News'),
  _ChannelData('assets/geo.jpg', '/geo', 'Geo News'),
  _ChannelData('assets/cnn.jpg', '/cnn', 'CNN'),
  _ChannelData('assets/dunya.jpg', '/dunya', 'Dunya News'),
  _ChannelData('assets/aaj.jpg', '/aajnews', 'Aaj News'),
  _ChannelData('assets/gnn.jpg', '/gnn', 'GNN'),
  _ChannelData('assets/rohi.jpg', '/rohi', 'Rohi TV'),
  _ChannelData('assets/city41.jpg', '/city41', 'City 41'),
  _ChannelData('assets/city42.jpg', '/city42', 'City 42'),
  _ChannelData('assets/dw.jpg', '/dw', 'DW'),
];

const _entertainment = [
  _ChannelData('assets/humtv.jpg', '/hum', 'Hum TV'),
  _ChannelData('assets/aplus.jpg', '/aplus', 'A Plus'),
  _ChannelData('assets/geotv.jpg', '/geoent', 'Geo TV'),
  _ChannelData('assets/ptvhome.jpg', '/ptvhome', 'PTV Home'),
  _ChannelData('assets/humsitary.jpg', '/humsitary', 'Hum Sitary'),
  _ChannelData('assets/hummasala.jpg', '/hummasala', 'Hum Masala'),
  _ChannelData('assets/expresstv.jpg', '/expressent', 'Express Ent'),
  _ChannelData('assets/urduone.jpg', '/urdu1', 'Urdu 1'),
  _ChannelData('assets/aajtv.jpg', '/aajtv', 'Aaj TV'),
  _ChannelData('assets/apnachannel.jpg', '/apnachannel', 'Apna Channel'),
  _ChannelData('assets/boltv.jpg', '/boltv', 'BOL TV'),
  _ChannelData('assets/tvone.jpg', '/tvone', 'TV One'),
  _ChannelData('assets/play.jpg', '/play', 'Play TV'),
  _ChannelData('assets/seetv.jpg', '/seetv', 'See TV'),
  _ChannelData('assets/ltn.jpg', '/ltn', 'LTN'),
  _ChannelData('assets/discovery.jpg', '/discovery', 'Discovery'),
];

const _kids = [
  _ChannelData('assets/cn.jpg', '/cn', 'Cartoon Network'),
  _ChannelData('assets/championtv.jpg', '/championtv', 'Champion TV'),
  _ChannelData('assets/discoverykids.jpg', '/discoverykids', 'Discovery Kids'),
];

const _movies = [
  _ChannelData('assets/filmax.jpg', '/filmax', 'Fil Max'),
  _ChannelData('assets/filmworld.jpg', '/filmworld', 'Film World'),
  _ChannelData('assets/movieone.jpg', '/movieone', 'Movie One'),
  _ChannelData('assets/8xm.jpg', '/8xm', '8XM'),
  _ChannelData('assets/jalwa.jpg', '/jalwa', 'Jalwa'),
];

const _sports = [
  _ChannelData('assets/tensports.jpg', '/tensports', 'Ten Sports'),
];

const _all = [
  ..._islamic,
  ..._news,
  ..._entertainment,
  ..._kids,
  ..._movies,
  ..._sports,
];

class AllChannels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF0A0A0A),
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'All Channels',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: const Color(0xFF00BCD4),
              indicatorWeight: 3,
              labelColor: const Color(0xFF00BCD4),
              unselectedLabelColor: Colors.white38,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Islamic'),
                Tab(text: 'News'),
                Tab(text: 'Entertainment'),
                Tab(text: 'Kids'),
                Tab(text: 'Movies'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _ChannelGrid(channels: _all),
              _ChannelGrid(channels: _islamic),
              _ChannelGrid(channels: _news),
              _ChannelGrid(channels: _entertainment),
              _ChannelGrid(channels: _kids),
              _ChannelGrid(channels: _movies),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChannelGrid extends StatelessWidget {
  final List<_ChannelData> channels;

  const _ChannelGrid({Key key, this.channels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: channels.length,
      itemBuilder: (context, index) {
        final ch = channels[index];
        return _GridChannelCard(channel: ch);
      },
    );
  }
}

class _GridChannelCard extends StatelessWidget {
  final _ChannelData channel;

  const _GridChannelCard({Key key, this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, channel.route),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    channel.asset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
              child: Text(
                channel.name,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
