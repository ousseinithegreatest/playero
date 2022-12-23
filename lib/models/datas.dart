import 'package:playero/models/video.dart';

class Datas {
  Video video1 = Video(
      title: "Voyage en montagne",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-large.mp4");

  Video video2 = Video(
      title: "Traction à la barre",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-muscular-man-doing-pull-ups-on-a-bar-44410-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-muscular-man-doing-pull-ups-on-a-bar-44410-large.mp4");
  Video video3 = Video(
      title: "Feux d'artifices",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-fireworks-illuminating-the-beach-sky-4157-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-fireworks-illuminating-the-beach-sky-4157-large.mp4");
  Video video4 = Video(
      title: "Un gamer",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-hands-of-a-man-playing-on-a-computer-43527-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-hands-of-a-man-playing-on-a-computer-43527-large.mp4");
  Video video5 = Video(
      title: "Chute d'eaux",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-waterfall-in-forest-2213-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-waterfall-in-forest-2213-large.mp4");
  Video video6 = Video(
      title: "Etudiants",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-students-walking-in-a-university-4519-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-students-walking-in-a-university-4519-large.mp4");
  Video video7 = Video(
      title: "Enfants qui jouent",
      preview:
          "https://mixkit.imgix.net/videos/preview/mixkit-children-playing-with-a-dancing-fountain-3469-0.jpg?q=80&auto=format%2Ccompress",
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-children-playing-with-a-dancing-fountain-3469-large.mp4");

  List<Video> parseVideos() {
    return [video1, video2, video3, video4, video5, video6, video7];
  }
}
