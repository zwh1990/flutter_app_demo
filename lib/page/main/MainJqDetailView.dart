import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_app_demo/page/jq/JqInputView.dart';

/**
 * 警情详情
 */
class MainJqDetailView extends StatefulWidget {
  final String txt;

  MainJqDetailView({Key key, @required this.txt}) : super(key: key);

  @override
  _MainJqDetailState createState() => new _MainJqDetailState();
}

class _MainJqDetailState extends State<MainJqDetailView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["模块一", "模块二", "模块三"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.txt),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          JqInputView(),
          JqInputView(),
          JqInputView(),
        ],
      ),
    );
  }
}
