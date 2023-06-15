import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayouyWidget extends StatelessWidget {
  LayouyWidget({super.key});
  final cards = [
    {"name": '张三', "age": 14},
    {"name": '李四', "age": 18},
    {"name": '王五', "age": 20},
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          const Text('布局组件'),
          ElevatedButton(
              onPressed: (() async {
                // 显示弹出框
                await showDialog(
                    context: context,
                    builder: ((context) {
                      // alert / simple / cupertion
                      return AlertDialog(
                        content: const Text('确定删除吗?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                print('取消了');
                                Navigator.pop(context);
                              },
                              child: const Text('取消')),
                          TextButton(
                              onPressed: () {
                                print('确定了');
                              },
                              child: const Text('确定'))
                        ],
                      );
                    }));
              }),
              child: const Text('测试点击事件')),
          Expanded(
            child: ListView.builder(
                // 列表垂直滚动
                // scrollDirection: Axis.vertical,
                // 列表长度
                itemCount: cards.length,
                cacheExtent: 200,
                itemBuilder: ((context, index) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Text(
                      '$index',
                      style: const TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
