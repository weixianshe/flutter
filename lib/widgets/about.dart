import 'package:first_app/getx/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Route1 extends StatelessWidget {
  const Route1({super.key});
  @override
  Widget build(BuildContext context) {
    var counter = Get.put(Counter());
    print(Get.parameters['name']);
    print(Get.parameters['age']);
    return Scaffold(
      appBar: AppBar(
        title: Text('route1'),
      ),
      body: Column(children: [
        Container(
          child: GetBuilder<Counter>(
            builder: (controller) {
              return Text('${counter.count.length}');
            },
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text('+1'))
      ]),
    );
  }
}
