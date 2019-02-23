import 'package:flutter/material.dart';
import 'package:media_player/data_sources.dart';
import 'package:media_player_demo/media_source.dart';
import 'package:media_player_demo/video_player_screen.dart';

class MediaListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(list[index]['title']),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              print(list[index]);
              if (list[index]['source'] is Playlist)
                return VideoPlayerScreen(playlist: list[index]['source']);
              else
                return VideoPlayerScreen(source: list[index]['source']);
            }));
          },
        );
      },
    );
  }
}
