import 'package:media_player/data_sources.dart';

final list = [
  {
    "title": "Simba Song",
    "source": MediaFile(
      title: "Ala re ala",
      type: "audio",
      source:
          "http://djmazacom.com/siteuploads/files/sfd8/3855/Aala%20Re%20Aala%20(Simmba)(DJMazacom.Com).mp3",
      desc: "Simba movie",
    )
  },
  {
    "title": "Despacito",
    "source": MediaFile(
      title: "Despacito",
      type: "video",
      source: "https://tcevents.com/video/Tecnocasa_Despacito.mp4",
      desc: "Despacito song no need description",
    ),
  },
  {
    "title": "Apple Keynote",
    "source": MediaFile(
      title: "Apple Keynote",
      type: "video",
      source: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
      desc: "sample m3u8 hls file for sreaing",
    ),
  },
  {
    "title": "Sample Playlist",
    "source": Playlist([
      MediaFile(
        title: "Apple Keynote",
        type: "video",
        source: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
        desc: "descriptin",
      ),
      MediaFile(
        title: "Despacito",
        type: "video",
        source: "https://tcevents.com/video/Tecnocasa_Despacito.mp4",
        desc: "descriptin",
      ),
    ])
  },
];
