import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/https/Api.dart';
import 'package:flutter_app_demo/https/http_util.dart';
import 'package:flutter_app_demo/model/main_jq_entity.dart';
import 'package:flutter_app_demo/widgets/MainJqItemView.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainJqView extends StatefulWidget {
  @override
  _MainJqViewState createState() => new _MainJqViewState();
}

class _MainJqViewState extends State<MainJqView> {
  List<MainJqEntity> jqList = new List();
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("初始化加载数据。");
    Future.delayed(Duration.zero, () {
      _onRefresh();
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    page = 0;
    getJqList(page);
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    page++;
    getJqList(page);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("警情"),
        centerTitle: true,
        leading: null,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context,
                  delegate: SearchBarDelegate(jqList: jqList))),
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return MainJqItemView(
                title: jqList[index].address, phone: jqList[index].phone);
          },
          itemCount: jqList == null ? 0 : jqList.length,
          itemExtent: 56,
        ),
      ),
    );
  }

  void getJqList(int page) {
    Future<dynamic> future =
        HttpUtil.responseJsonParse<List<MainJqEntity>>(Api.JQLIST_URL, context,"正在加载，请稍等...");
    future.then((value) {
      setState(() {
        if (page == 0) {
          jqList = value;
        } else {
          jqList.addAll(value);
        }
      });
    });
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  List<MainJqEntity> jqList = new List();

  SearchBarDelegate({@required this.jqList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
            showSuggestions(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? jqList
        : jqList.where((input) => input.address.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return MainJqItemView(
            title: suggestionList[index].address,
            phone: suggestionList[index].phone);
      },
      itemExtent: 56,
    );
  }
}
