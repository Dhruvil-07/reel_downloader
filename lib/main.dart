import 'package:flutter/material.dart';
import 'package:reel_downloader/download.dart';

void main()
{
  runApp(reel_downloader());
}


class reel_downloader extends StatelessWidget {
  const reel_downloader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: download(),
      debugShowCheckedModeBanner: false,
    );
  }
}
