import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeccondRoute extends StatelessWidget {
  final String txt;

  SeccondRoute({Key key, @required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(txt),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "456"),
                child: Text("点击返回数据"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
