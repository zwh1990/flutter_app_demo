import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_demo/https/Api.dart';
import 'package:flutter_app_demo/https/http_util.dart';
import 'package:flutter_app_demo/model/compat_list_entity.dart';
import 'package:flutter_app_demo/model/jq_detail_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'JqDetailItemView.dart';

class JqDetailView extends StatefulWidget {
  @override
  _JqDetailViewState createState() {
    return new _JqDetailViewState();
  }
}

class _JqDetailViewState extends State {
  List<JqDetailEntity> jqDetailList = new List();
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      _onRefresh();
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    page = 0;
    getDetailJqList(page);
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    page++;
    getDetailJqList(page);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          return JqDetailItemView(detailEntity: jqDetailList[index]);
        },
        itemCount: jqDetailList.length,
        itemExtent: 86,
      ),
    ));
  }

  void getDetailJqList(int page) {
    Future<dynamic> future = HttpUtil.responseJsonParse<CompatListEntity>(
        Api.JQDETAILLIST_URL, context,"正在加载，请稍等...");
    future.then((value) {
      print((value as CompatListEntity).count);
      List<JqDetailEntity> list = JsonConvert.fromJsonAsT<List<JqDetailEntity>>(
          (value as CompatListEntity).data);
      setState(() {
        if (page == 0) {
          jqDetailList = list;
        } else {
          jqDetailList.addAll(list);
        }
      });
    });
  }
}
