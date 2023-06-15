import 'package:first_app/getx/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayVideos extends StatelessWidget {
  const PlayVideos({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryStore cate = Get.put(CategoryStore());
    return GetBuilder<CategoryStore>(builder: ((controller) {
      if (controller.controller != null) {
        return Column(children: [
          AspectRatio(
            aspectRatio: cate.controller!.value.aspectRatio,
            child: VideoPlayer(cate.controller!),
          ),
          IconButton(
              onPressed: () {
                print('是否播放: ${controller.isPlaying}');
                if (controller.isPlaying) {
                  controller.controller!.pause();
                } else {
                  controller.controller!.play();
                }
              },
              icon: Icon(controller.controller!.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow))
        ]);
      } else {
        return const CircularProgressIndicator();
      }
    }));
  }
}
