import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMeView extends StatefulWidget {
  @override
  _MainMeViewState createState() => new _MainMeViewState();
}

class _MainMeViewState extends State<MainMeView> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("我的"),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主体颜色变化")
              ],
            ),
            Theme(
              data: _themeData.copyWith(
                  iconTheme:
                      _themeData.iconTheme.copyWith(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定为黑色")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FutureBuilder<String>(
                future: mockNetworkData(),
                builder: (BuildContext context, AsyncSnapshot snapShot) {
                  if (snapShot.connectionState == ConnectionState.done) {
                    if (snapShot.hasError) {
                      return Text(
                        "请求错误",
                        style: TextStyle(fontSize: 20),
                      );
                    } else {
                      return Text(
                        "请求成功",
                        style: TextStyle(fontSize: 20),
                      );
                    }
                  } else {
                    return Text(
                      "正在请求",
                      style: TextStyle(fontSize: 20),
                    );
                  }
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _themeColor =
                  _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });
          },
          child: Icon(Icons.settings),
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "网络请求数据");
  }
}
