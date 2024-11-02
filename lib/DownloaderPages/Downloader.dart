import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildDownloaderPage(BuildContext context, String title) {
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
                  // Implement download functionality here
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