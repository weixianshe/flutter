import 'package:first_app/getx/songs.dart';
import 'package:first_app/widgets/play_music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsWidget extends StatelessWidget {
  const SongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SongsStore());
    return GetBuilder<SongsStore>(builder: ((controller) {
      print(controller.songDetail?.songs);
      return Container(
          height: 180,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.getSongDetail('347230');
                  },
                  child: const Text('点我')),
              controller.songDetail?.songs != null
                  ? const PlayMusic()
                  : const Text('暂无数据')
            ],
          ));
    }));
  }
}
