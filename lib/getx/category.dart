import 'package:dio/dio.dart';
import 'package:first_app/utils/data.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CategoryStore extends GetxController {
  double value = 0;
  final double _duration = 0;
  String curPos = '';
  String duration = '';
  VideoPlayerController? _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  VideoPlayerController? get controller => _controller;
  Future<void> get videoPlayerFuture => _initializeVideoPlayerFuture;
  bool get isPlaying => _isPlaying;
  String url = '';
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
    _controller!.dispose();
  }

  void getData() async {
    var video = await Dio().get('https://ncm.icodeq.com/mv/url?id=5436712');
    String url = video.data["data"]["url"];
    playVideo(url);
    update();
  }

  void playVideo(String url) {
    _controller = VideoPlayerController.network(
      url,
    );
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller!.initialize();
    _initializeVideoPlayerFuture.then((val) {
      Duration dur = _controller!.value.duration;
      int _dur = dur.inHours * 60 * 60 + dur.inMinutes * 60 + dur.inSeconds;
      String time = FormatData.formatDuration(dur);
      duration = time;
    });
    _controller!.addListener(_videoListener);
  }

  void _videoListener() {
    if (_duration != 0 && value != 0 && value >= _duration) {
      _controller!.removeListener(_videoListener);
      return;
    }
    if (_controller!.value.isPlaying != _isPlaying) {
      _isPlaying = _controller!.value.isPlaying;
    }
    var curPosition = _controller!.value.position;
    String time = FormatData.formatDuration(curPosition);
    curPos = time;
  }
}
