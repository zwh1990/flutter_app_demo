import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/jq_detail_entity.dart';

class JqDetailItemView extends StatefulWidget {
  final JqDetailEntity detailEntity;

  JqDetailItemView({Key key, @required this.detailEntity}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JqDetailItemViewState(detailEntity: detailEntity);
  }
}

class _JqDetailItemViewState extends State {
  Divider divider = new Divider(color: Colors.grey, height: 10, thickness: 0.5);

  final JqDetailEntity detailEntity;

  _JqDetailItemViewState({@required this.detailEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
            elevation: 10,
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: new Container(
              padding: EdgeInsets.all(5),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "姓名:" + detailEntity.name,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "性别:" + detailEntity.sex,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  divider,
                  Text(
                    "案件编号:" + detailEntity.ajbh,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  divider,
                  Text(
                    "身份证号码:" + detailEntity.sfzh,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            )));
  }
}
