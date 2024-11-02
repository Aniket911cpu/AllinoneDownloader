import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Widget buildDownloaderPage(BuildContext context, String title, Function(String) downloadFunction) {
  final TextEditingController _controller = TextEditingController();

  return Scaffold(
    appBar: AppBar(
      title: Text('Download from $title'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Enter the link',
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  downloadFunction(_controller.text);
                },
                child: const Text('Download'),
              ),
              ElevatedButton(
                onPressed: () async {
                  ClipboardData? data = await Clipboard.getData('text/plain');
                  if (data != null) {
                    _controller.text = data.text!;
                  }
                },
                child: const Text('Paste'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<void> downloadContent(String url, String savePath) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final file = File(savePath);
      await file.writeAsBytes(response.bodyBytes);
      print('Content downloaded successfully.');
    } else {
      print('Failed to download content.');
    }
  } catch (e) {
    print('Error: $e');
  }
}

class InstagramVideoPage extends StatelessWidget {
  const InstagramVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Instagram Video', (url) {
      downloadContent(url, '/path/to/save/instagram_video.mp4');
    });
  }
}

class InstagramImagePage extends StatelessWidget {
  const InstagramImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Instagram Image', (url) {
      downloadContent(url, '/path/to/save/instagram_image.jpg');
    });
  }
}

class InstagramProfilePage extends StatelessWidget {
  const InstagramProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Instagram Profile', (url) {
      downloadContent(url, '/path/to/save/instagram_profile.zip');
    });
  }
}

class YouTubeVideoPage extends StatelessWidget {
  const YouTubeVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'YouTube Video', (url) {
      downloadContent(url, '/path/to/save/youtube_video.mp4');
    });
  }
}

class YouTubePlaylistPage extends StatelessWidget {
  const YouTubePlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'YouTube Playlist', (url) {
      downloadContent(url, '/path/to/save/youtube_playlist.zip');
    });
  }
}

class YouTubeProfilePage extends StatelessWidget {
  const YouTubeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'YouTube Profile', (url) {
      downloadContent(url, '/path/to/save/youtube_profile.zip');
    });
  }
}

class RedditVideoPage extends StatelessWidget {
  const RedditVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Reddit Video', (url) {
      downloadContent(url, '/path/to/save/reddit_video.mp4');
    });
  }
}

class RedditImagePage extends StatelessWidget {
  const RedditImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Reddit Image', (url) {
      downloadContent(url, '/path/to/save/reddit_image.jpg');
    });
  }
}

class RedditProfilePage extends StatelessWidget {
  const RedditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Reddit Profile', (url) {
      downloadContent(url, '/path/to/save/reddit_profile.zip');
    });
  }
}

class FacebookVideoPage extends StatelessWidget {
  const FacebookVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Facebook Video', (url) {
      downloadContent(url, '/path/to/save/facebook_video.mp4');
    });
  }
}

class FacebookImagePage extends StatelessWidget {
  const FacebookImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Facebook Image', (url) {
      downloadContent(url, '/path/to/save/facebook_image.jpg');
    });
  }
}

class FacebookProfilePage extends StatelessWidget {
  const FacebookProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDownloaderPage(context, 'Facebook Profile', (url) {
      downloadContent(url, '/path/to/save/facebook_profile.zip');
    });
  }
}