import 'package:flutter/material.dart';
import 'package:playero/controllers/player_controller.dart';
import 'package:playero/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  const VideoTile({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => tapAction(context)),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 7,
        child: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(video.preview),
              Text(
                video.title,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  tapAction(BuildContext context) {
    final route =
        MaterialPageRoute(builder: (context) => PlayerController(video: video));
    Navigator.push(context, route);
  }
}
