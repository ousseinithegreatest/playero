import 'package:flutter/material.dart';
import 'package:playero/models/datas.dart';
import 'package:playero/models/video.dart';
import 'package:playero/widgets/app_bar.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends StatefulWidget {
  final Video video;
  const PlayerController({super.key, required this.video});

  @override
  State<PlayerController> createState() => _PlayerControllerState();
}

class _PlayerControllerState extends State<PlayerController> {
  late Video _video;
  late VideoPlayerController _videoPlayerController;
  late int index;

  bool canMountVideoPlayer() => _videoPlayerController.value.isInitialized;
  bool isPlaying() => _videoPlayerController.value.isPlaying;
  int getIndex() =>
      Datas().parseVideos().indexWhere((vid) => _video.url == vid.url);

  @override
  void initState() {
    super.initState();
    _video = widget.video;
    index = getIndex();
    configurePlayer();
  }

  @override
  void dispose() {
    deletePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(data: _video.title),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                canMountVideoPlayer()
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    : Container(),
                VideoProgressIndicator(_videoPlayerController,
                    allowScrubbing: true),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "${_videoPlayerController.value.duration.inSeconds}s",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${_videoPlayerController.value.position.inSeconds}s",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              _video.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              // margin: const EdgeInsets.all(10),
              child: Card(
                color: Colors.deepOrange.shade500,
                elevation: 3,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: previous,
                          icon: const Icon(Icons.skip_previous)),
                      IconButton(
                          color: Colors.white,
                          onPressed: playPause,
                          icon: Icon(isPlaying()
                              ? Icons.pause_circle
                              : Icons.play_circle)),
                      IconButton(
                          color: Colors.white,
                          onPressed: next,
                          icon: const Icon(Icons.skip_next)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                  itemCount: Datas().parseVideos().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final newVideo = Datas().parseVideos()[index];
                    return InkWell(
                      onTap: (() => tapAction),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: ClipRRect(
                          child: Image.network(
                            newVideo.preview,
                            fit: BoxFit.cover,
                            width: 140,
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  configurePlayer() {
    _videoPlayerController = VideoPlayerController.network(_video.url);
    _videoPlayerController.initialize().then((isInit) => update());
    _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(() => update());
    _videoPlayerController.play();
  }

  deletePlayer() {
    _videoPlayerController.dispose();
  }

  update() {
    setState(() {});
  }

  playPause() {
    isPlaying()
        ? _videoPlayerController.pause()
        : _videoPlayerController.play();
    update();
  }

  next() {
    index = (index == Datas().parseVideos().length - 1) ? 0 : index + 1;
    _video = Datas().parseVideos()[index];
    configurePlayer();
  }

  previous() {
    index = (index == 0) ? Datas().parseVideos().length - 1 : index - 1;
    _video = Datas().parseVideos()[index];
    configurePlayer();
  }

  tapAction(BuildContext context) {
    final route = MaterialPageRoute(
        builder: (context) => PlayerController(video: _video));
    Navigator.push(context, route);
  }
}
