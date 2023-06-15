import 'package:first_app/getx/songlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongListWidget extends StatelessWidget {
  const SongListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SongListStore());
    return GetBuilder<SongListStore>(builder: ((_) {
      return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: const Text('排行榜'),
          centerTitle: true,
          bottom: TabBar(
            tabs: _.myTabs,
            controller: _.tabController,
          ),
        ),
        body: TabBarView(controller: _.tabController, children: [
          official(),
          choiceness(),
          genre(),
          global(),
          language()
        ]),
      );
    }));
  }
}

Widget official() {
  return ListView(
    children: [
      Text(
        '榜单推荐',
        style: TextStyle(fontSize: 24),
      )
    ],
  );
}

Widget choiceness() {
  return const Text('精选的');
}

Widget genre() {
  return const Text('曲风的');
}

Widget global() {
  return const Text('全球的');
}

Widget language() {
  return const Text('语种的');
}
