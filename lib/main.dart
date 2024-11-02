import 'package:flutter/material.dart';
import 'DownloaderPages/downloadPages.dart';
import 'Homepage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkTheme = isDark;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All-in-One Downloader',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(onThemeChanged: _toggleTheme),
      routes: {
        '/instagram/video': (context) => const InstagramVideoPage(),
        '/instagram/image': (context) => const InstagramImagePage(),
        '/instagram/profile': (context) => const InstagramProfilePage(),
        '/youtube/video': (context) => const YouTubeVideoPage(),
        '/youtube/playlist': (context) => const YouTubePlaylistPage(),
        '/youtube/profile': (context) => const YouTubeProfilePage(),
        '/reddit/video': (context) => const RedditVideoPage(),
        '/reddit/image': (context) => const RedditImagePage(),
        '/reddit/profile': (context) => const RedditProfilePage(),
        '/facebook/video': (context) => const FacebookVideoPage(),
        '/facebook/image': (context) => const FacebookImagePage(),
        '/facebook/profile': (context) => const FacebookProfilePage(),
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}