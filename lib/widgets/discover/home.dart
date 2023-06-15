import 'package:first_app/getx/home.dart';
import 'package:first_app/utils/colors.dart';
import 'package:first_app/widgets/discover/components/category.dart';
import 'package:first_app/widgets/discover/components/song_list.dart';
import 'package:first_app/widgets/songs/songs.dart';
import 'package:first_app/widgets/swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  _buildTabbar() {
    return TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: FormatColor.hexToColor('#e84059'),
        tabs: const [
          Tab(
            text: '推荐',
          ),
          Tab(
            text: '编辑精选',
          ),
          Tab(
            text: '排行榜',
          ),
          Tab(
            text: '助眠',
          ),
          Tab(
            text: '说唱',
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Get.put(HomeStore());
    final TextEditingController _textEditingController =
        TextEditingController();
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: FormatColor.hexToColor('#f7f8fc'),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FormatColor.hexToColor('#E5E3F8'),
                  FormatColor.hexToColor('#f2e6f2')
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: _buildTabbar(),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          title: GestureDetector(
            onTap: () {
              Get.toNamed('/search');
            },
            child: SizedBox(
              height: 30,
              child: TextField(
                enabled: false,
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: '请输入内容',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          actions: const [
            Icon(Icons.people),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: GetBuilder<HomeStore>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  SwiperWidget(
                    bannerList: controller.bannerList,
                  ),
                  const Category(),
                  Row(
                    children: const [
                      Text('排行榜'),
                      Icon(Icons.arrow_circle_right)
                    ],
                  ),
                  // const TopList(),
                  const SongsWidget()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
