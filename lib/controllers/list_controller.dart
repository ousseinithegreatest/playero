import 'package:flutter/material.dart';
import 'package:playero/models/datas.dart';
import 'package:playero/models/video.dart';
import 'package:playero/views/video_tile_view.dart';
import 'package:playero/widgets/app_bar.dart';

class ListController extends StatelessWidget {
  List<Video> videos = Datas().parseVideos();
  // const ListController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(data: "Videos"),
        body: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) => VideoTile(video: videos[index])));
  }
}
