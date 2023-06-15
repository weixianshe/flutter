import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongListStore extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: '官方',
    ),
    const Tab(
      text: '精选',
    ),
    const Tab(
      text: '曲风',
    ),
    const Tab(
      text: '全球',
    ),
    const Tab(
      text: '语种',
    )
  ];

  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController?.addListener(() {
      if (tabController?.index == tabController?.animation?.value) {
        print('当前index==${tabController?.index}');
      }
    });
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
