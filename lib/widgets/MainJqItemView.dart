import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/page/main/MainJqDetailView.dart';

class MainJqItemView extends StatefulWidget {
  final String title;

  MainJqItemView({Key key, @required this.title}) : super(key: key);

  @override
  _MainJqItemViewState createState() => new _MainJqItemViewState();
}

class _MainJqItemViewState extends State<MainJqItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "地址:" + widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "手机号:" + "123456789",
                style: TextStyle(fontSize: 14, color: Colors.orange),
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 1,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new MainJqDetailView(txt: widget.title);
        }));
      },
    );
  }
}
