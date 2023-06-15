import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStore extends GetxController {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List _topList = [];
  List bannerList = [];

  var hot_list = {};
  var original_list = {};
  var edit_list = {};
  var online_hot = {};
  var mlogToplist = {};

  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex;
  List get topList => _topList;
  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void onChangeCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getHttp();
  }

  void getHttp() async {
    var res = await Dio().get('http://localhost:3000/homepage/block/page');
    var blocks = res.data["data"]['blocks'];
    var banner = blocks.firstWhere((e) => e["blockCode"] == "HOMEPAGE_BANNER");
    bannerList = banner["extInfo"]["banners"]
        .map((item) => ({"imageUrl": item["pic"]}))
        .toList();
    var topList =
        blocks.firstWhere((e) => e["blockCode"] == 'HOMEPAGE_BLOCK_TOPLIST');
    topList["creatives"].forEach((item) {
      var creativeId = item['creativeId'];
      // 热歌榜
      if (creativeId == '3778678') {
        hot_list["id"] = creativeId;
        hot_list["list"] = item['resources'];
        hot_list["mainTitle"] = item["uiElement"]["mainTitle"];
        //  原创榜
      } else if (creativeId == '2884035') {
        original_list["id"] = creativeId;
        original_list["list"] = item['resources'];
        original_list["mainTitle"] = item["uiElement"]["mainTitle"];
        // 编辑推荐榜
      } else if (creativeId == '7325478166') {
        edit_list["id"] = creativeId;
        edit_list["list"] = item['resources'];
        edit_list["mainTitle"] = item["uiElement"]["mainTitle"];
        // 网络热歌榜
      } else if (creativeId == '6723173524') {
        online_hot["id"] = creativeId;
        online_hot["list"] = item['resources'];
        online_hot["mainTitle"] = item["uiElement"]["mainTitle"];
      } else if (creativeId == 'MUSIC_MV##') {
        mlogToplist['mainTitle'] = item["uiElement"]["mainTitle"];
        mlogToplist["list"] = item["resources"];
      }
    });
    _topList
        .addAll([hot_list, original_list, edit_list, online_hot, mlogToplist]);
    update();
  }
}
