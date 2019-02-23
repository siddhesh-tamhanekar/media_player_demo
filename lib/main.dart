import 'package:flutter/material.dart';
import 'package:media_player_demo/media_list_page.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Media Player Demo"),
        ),
        body: new MediaListPage());
  }
}
