import 'package:first_app/getx/home.dart';
import 'package:first_app/utils/colors.dart';
import 'package:first_app/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});
  Widget firstPage() {
    var firset = FormatData.icons.sublist(0, 5);
    return GridView.builder(
        itemCount: 5,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: ((context, index) {
          var item = firset[index];
          return GestureDetector(
            onTap: () {
              if (item['text'] == '排行榜') {
                Get.toNamed('/songlist');
              }
            },
            child: Column(
              children: [
                Image.network(
                  item['icon']!,
                  width: 50,
                  height: 50,
                ),
                Text(item['text']!)
              ],
            ),
          );
        }));
  }

  Widget nextPage() {
    var firset = FormatData.icons.sublist(6, FormatData.icons.length);
    return GridView.builder(
        itemCount: 4,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: ((context, index) {
          var item = firset[index];
          return Column(
            children: [
              Image.network(
                item['icon']!,
                width: 50,
                height: 50,
              ),
              Text(item['text']!)
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Get.put(HomeStore());
    return GetBuilder<HomeStore>(builder: ((controller) {
      return SizedBox(
          height: 100,
          child: Column(children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onChangeCurrentIndex,
                children: [firstPage(), nextPage()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 5,
                  decoration: BoxDecoration(
                      color: controller.currentIndex == 0
                          ? FormatColor.hexToColor('#ef9895')
                          : FormatColor.hexToColor('#f5e9ed')),
                ),
                Container(
                  width: 20,
                  height: 5,
                  decoration: BoxDecoration(
                      color: controller.currentIndex == 1
                          ? FormatColor.hexToColor('#ef9895')
                          : FormatColor.hexToColor('#f5e9ed')),
                )
              ],
            )
          ]));
    }));
  }
}
