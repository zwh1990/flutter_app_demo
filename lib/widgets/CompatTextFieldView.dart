import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompatTextFieldView extends StatelessWidget {
  /// 录入项title
  String title;

  /// 录入项hint
  String hint;

  ///controler
  TextEditingController controler;

  CompatTextFieldView({Key key,@required this.controler,
    @required this.title, @required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, minHeight: 40, maxHeight: 40),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
                child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            )),
          ),
          Expanded(
            flex: 7,
            child: Container(
                child: TextField(
              autofocus: true,
              controller: controler,
              style: TextStyle(fontSize: 14, color: Colors.blue),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8, bottom: 8),
              ),
            )),
          )
        ],
      ),
    );
  }
}
