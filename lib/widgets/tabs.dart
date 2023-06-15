import 'package:flutter/material.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

// with SingleTickerProviderStateMixin 获取this
class _TabsWidgetState extends State<TabsWidget>
    with SingleTickerProviderStateMixin {
  // 获取tabbar控制器
  late TabController _tabController;
  @override
  // 在初始化时设置tabbar个数
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        // 解决点击切换执行两次
        if (!_tabController.indexIsChanging)
          switch (_tabController.index) {
            case 0:
              print('111');
              break;
            case 1:
              print('2222');
              break;
            case 2:
              print('3333');
              break;
            case 3:
              print('4444');
              break;
          }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorSize:
              TabBarIndicatorSize.label, // 指示器大小  label：和文字等宽 tab: 和tab等宽，默认平分
          indicatorColor: Colors.purple, // 指示器颜色
          tabs: const [
            Tab(
              child: Text(
                '首页',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Tab(
              child: Text(
                '热门',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Tab(
              child: Text(
                '科幻',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Tab(
              child: Text(
                '玄幻',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
          controller: _tabController,
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.red),
          child: TabBarView(
            // tabbar内容显示区域
            children: const [
              Center(
                child: Text('首页的内容'),
              ),
              Center(
                child: Text('热门的内容'),
              ),
              Center(
                child: Text('科幻的内容'),
              ),
              Center(
                child: Text('玄幻的内容'),
              )
            ],
            controller: _tabController,
          ),
        )
      ],
    );
  }
}
