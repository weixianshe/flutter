import 'package:dio/dio.dart';
import 'package:first_app/getx/counter.dart';
import 'package:first_app/utils/data.dart';
import 'package:first_app/widgets/about.dart';
import 'package:first_app/widgets/layout.dart';
import 'package:first_app/widgets/login.dart';
import 'package:first_app/widgets/discover/home.dart';
import 'package:first_app/widgets/my/my.dart';
import 'package:first_app/widgets/play_music.dart';
import 'package:first_app/widgets/play_video.dart';
import 'package:first_app/widgets/search/search.dart';
import 'package:first_app/widgets/songlist/song_list.dart';
import 'package:first_app/widgets/swiper.dart';
import 'package:first_app/widgets/tabs.dart';
import 'package:first_app/widgets/test2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '我的第一个应用'),
      getPages: [
        GetPage(name: '/route', page: () => const Route1()),
        GetPage(name: '/test', page: () => const Test2()),
        GetPage(name: '/search', page: () => const SearchWidget()),
        GetPage(name: '/songlist', page: () => const SongListWidget())
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _controller.jumpToPage(value);
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(label: '发现', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: '播客', icon: Icon(Icons.category)),
            BottomNavigationBarItem(label: '我的', icon: Icon(Icons.people)),
            BottomNavigationBarItem(label: '关注', icon: Icon(Icons.people)),
            BottomNavigationBarItem(label: '社区', icon: Icon(Icons.people)),
          ]),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeWidget(),
          CategoryWidget(),
          MyWidget(),
          ProfileWidget(),
          PlayMusic()
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: Text(
            'category',
            style: TextStyle(color: Colors.red),
          ),
        ),
        PlayVideos()
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Counter count = Get.put(Counter());
    var list = [1, 2, 3, 4, 5];
    void getData() {
      count.changeIcons(FormatData.icons);
    }

    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1), (() {
          print('上拉刷新');
        }));
      },
      child: ListView(
        children: [
          const LoginWidget(),
          IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.add)),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return Card(
                    child: Container(
                  height: 200,
                  child: Text('${index}'),
                  decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.red : Colors.blue),
                ));
              }))
        ],
      ),
    );
  }
}
