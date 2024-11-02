import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const MyHomePage({super.key, required this.onThemeChanged});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All-in-One Downloader'),
        actions: <Widget>[
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              setState(() {
                _isDarkTheme = value;
              });
              widget.onThemeChanged(value);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Welcome to All-in-One Downloader',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                // Handle contact us action
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text('Rate Us'),
              onTap: () {
                // Handle rate us action
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Handle about action
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildPlatformSection(context, 'YouTube', Icons.video_library, [
            _buildHorizontalListTile(context, 'Video Downloader', '/youtube/video'),
            _buildHorizontalListTile(context, 'Playlist Downloader', '/youtube/playlist'),
            _buildHorizontalListTile(context, 'Bio Generator', '/youtube/bio'),
          ]),
          _buildPlatformSection(context, 'Instagram', Icons.camera_alt, [
            _buildHorizontalListTile(context, 'Video Downloader', '/instagram/video'),
            _buildHorizontalListTile(context, 'Image Downloader', '/instagram/image'),
            _buildHorizontalListTile(context, 'Profile Downloader', '/instagram/profile'),
          ]),
          _buildPlatformSection(context, 'Reddit', Icons.reddit, [
            _buildHorizontalListTile(context, 'Video Downloader', '/reddit/video'),
            _buildHorizontalListTile(context, 'Image Downloader', '/reddit/image'),
            _buildHorizontalListTile(context, 'Profile Downloader', '/reddit/profile'),
          ]),
          _buildPlatformSection(context, 'Facebook', Icons.facebook, [
            _buildHorizontalListTile(context, 'Video Downloader', '/facebook/video'),
            _buildHorizontalListTile(context, 'Image Downloader', '/facebook/image'),
            _buildHorizontalListTile(context, 'Profile Downloader', '/facebook/profile'),
          ]),
        ],
      ),
    );
  }

  Widget _buildPlatformSection(BuildContext context, String title, IconData icon, List<Widget> children) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(icon, size: 50.0),
            title: Text(title, style: const TextStyle(fontSize: 18.0)),
          ),
          SizedBox(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalListTile(BuildContext context, String title, String route) {
    return Container(
      width: 150.0,
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(title, textAlign: TextAlign.center),
      ),
    );
  }
}