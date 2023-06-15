import 'package:first_app/getx/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopList extends StatelessWidget {
  const TopList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Get.put(HomeStore());
    return GetBuilder<HomeStore>(builder: ((controller) {
      return SizedBox(
        height: 300,
        child: controller.topList.isEmpty
            ? const CircularProgressIndicator()
            : ListView(
                scrollDirection: Axis.horizontal,
                children: _renderItem(controller.topList),
              ),
      );
    }));
  }
}

List<Widget> _renderItem(List toplist) {
  return toplist.isNotEmpty
      ? toplist.map((item) {
          return Card(
              child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item?['mainTitle']?['title'] ?? '---',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              item?['mainTitle']?['titleDesc'] ?? '===',
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    _buildCardItem(
                      item['list'],
                    ),
                  ])));
        }).toList()
      : [const Text('暂无数据')];
}

Widget _buildCardItem(List list) {
  return Expanded(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: _formatItem(list),
  ));
}

List<Widget> _formatItem(List list) {
  return list.isNotEmpty
      ? list.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item["uiElement"]['image']['imageUrl'],
                      fit: BoxFit.fill,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('${1}'),
                            Column(
                              children: [
                                Text(item["uiElement"]['mainTitle']['title']),
                                item["resourceExtInfo"] != null
                                    ? Text(item["resourceExtInfo"]['songData']
                                        ['artists'][0]['name'])
                                    : const Text(''),
                              ],
                            )
                          ],
                        ),
                        Text(item["uiElement"]['labelText']['text'] ?? '霸榜')
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList()
      : [const Text('666')];
}
