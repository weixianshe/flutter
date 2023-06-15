import 'package:dio/dio.dart';
import 'package:first_app/modals/songs/song_detail.modal.dart';
import 'package:first_app/modals/songs/song_url_modal.dart';
import 'package:first_app/utils/data.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SongsStore extends GetxController {
  final AudioPlayer _player = AudioPlayer();
  String _songUrl = '';
  String durationTime = '';
  bool isPlaying = false;

  SongDetail? _songDetail;
  String get songUrl => _songUrl;
  SongDetail? get songDetail => _songDetail;
  AudioPlayer get player => _player;

  @override
  void onClose() {
    _player.dispose();
    super.onClose();
  }

  void initSongs(int id) async {
    var res = await Dio().get('http://localhost:3000/song/url?id=$id');
    _songUrl = SongUrl.fromJson(res.data).data?[0].url ?? '';
    try {
      final duration = await _player.setUrl(_songUrl);
      isPlaying = _player.playing;
      durationTime = FormatData.formatDuration(duration!);
      print(durationTime);
      print(isPlaying);
      play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
    update();
  }

  Future<void> init(int? id) async {}

  void pause() {
    _player.pause();
  }

  void play() {
    _player.play();
  }

  getSongDetail(String id) async {
    var res = await Dio().get('http://localhost:3000/song/detail?ids=$id');
    _songDetail = SongDetail.fromJson(res.data);
    update();
  }
}
