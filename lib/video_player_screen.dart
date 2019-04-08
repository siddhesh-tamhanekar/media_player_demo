import 'package:flutter/material.dart';
import 'package:media_player/data_sources.dart';
import 'package:media_player/media_player.dart';
import 'package:media_player/ui.dart';

class VideoPlayerScreen extends StatefulWidget {
  final MediaFile source;
  final Playlist playlist;
  VideoPlayerScreen({this.source, this.playlist});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  MediaPlayer player;
  int currentPlaylistIndex;
  var currentSource;
  @override
  void initState() {
    player =
        MediaPlayerPlugin.create(isBackground: true, showNotification: true);
    initVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void initVideoPlayer() async {
    await player.initialize();

    player.valueNotifier.addListener(() {
      this.currentPlaylistIndex = player.valueNotifier.value.currentIndex;
      this.currentSource = player.valueNotifier.value.source;
      setState(() {});
    });

    if (widget.source != null) {
      await player.setSource(widget.source);
    }
    if (widget.playlist != null) {
      await player.setPlaylist(widget.playlist);
    }
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        VideoPlayerView(player),
        VideoProgressIndicator(
          player,
          allowScrubbing: true,
          // padding: EdgeInsets.symmetric(vertical:5.0),
        ),
        buildButtons(),
        playlistView(),
      ]),
    );
  }

  Row buildButtons() {
    return Row(
      children: <Widget>[
        FlatButton(
          child: Text("Prev"),
          onPressed: () {
            player.playPrev();
          },
        ),
        FlatButton(
          child: Text("Play"),
          onPressed: () {
            player.play();
          },
        ),
        FlatButton(
          child: Text("Pause"),
          onPressed: () {
            player.pause();
          },
        ),
        FlatButton(
          child: Text("Next"),
          onPressed: () {
            player.playNext();
          },
        ),
      ],
    );
  }

  Widget playlistView() {
    return (this.currentSource is Playlist)
        ? Expanded(
            child: ListView.builder(
            itemCount: widget.playlist.count,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(this.currentSource.mediaFiles[index].title),
                trailing: IconButton(
                    onPressed: () {
                      this.player.playAt(index);
                    },
                    icon: Icon(
                      (this.currentPlaylistIndex == index)
                          ? Icons.pause
                          : Icons.play_arrow,
                    )),
              );
            },
          ))
        : Container(
            child: Text(
            "Single Data source",
          ));
  }
}
