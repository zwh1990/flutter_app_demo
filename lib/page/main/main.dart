import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/page/main/MainAjView.dart';
import 'package:flutter_app_demo/page/main/MainJqView.dart';
import 'package:flutter_app_demo/page/main/MainMeView.dart';

class MainView extends StatefulWidget {
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<MainView> {
  int _selectedIndex = 0;
  var _controler = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controler,
        children: <Widget>[
          MainJqView(),
          MainAjView(),
          MainMeView(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('警情')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('案件')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTap,
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: _add,
//      ),
    );
  }

  void _onItemTap(int index) {
    print("切换模块");
    _controler.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  void _add() {
    print("添加数据");
  }
}
