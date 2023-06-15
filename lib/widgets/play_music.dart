import 'package:first_app/getx/songs.dart';
import 'package:first_app/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayMusic extends StatelessWidget {
  const PlayMusic({super.key});

  @override
  Widget build(BuildContext context) {
    SongsStore songsStore = Get.find<SongsStore>();
    return GetBuilder<SongsStore>(builder: ((controller) {
      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              controller.songDetail?.songs[0].al.picUrl ?? '',
              width: 40,
              height: 40,
            ),
          ),
          Text(controller.songDetail?.songs[0].name ?? '无数据'),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          controller.isPlaying
              ? IconButton(
                  onPressed: () {}, icon: Icon(Icons.pause_circle_outline))
              : IconButton(
                  onPressed: () {
                    controller.initSongs(33894312);
                  },
                  icon: const Icon(Icons.play_circle_outline),
                  iconSize: 34,
                ),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          StreamBuilder(
              stream: controller.player.positionStream,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data as Duration;
                  return Text('播放位置${FormatData.formatDuration(data)}');
                } else {
                  return const Text('无数据');
                }
              }))
        ],
      );
    }));
  }
}
