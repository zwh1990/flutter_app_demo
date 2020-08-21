import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

/*
警情详情录入页面
 */
class JqInputView extends StatefulWidget {
  @override
  _JqInputViewState createState() => new _JqInputViewState();
}

class _JqInputViewState extends State {
  Divider divider =
      new Divider(color: Colors.grey, height: 1.0, thickness: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          new GestureDetector(
            onTap: _selectTime,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "开始时间:",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Expanded(
                    child: Text(
                      "请选择开始时间",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                  Image.asset(
                    "images/arrow_right.png",
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          divider,
          new GestureDetector(
            onTap: _selectTime,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "结束时间:",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Expanded(
                    child: Text(
                      "请选择结束时间",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                  Image.asset(
                    "images/arrow_right.png",
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /**
   * 选择时间
   */
  _selectTime() {
    print("选择时间");
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.now().add(Duration(hours: -24 * 1)),
      //最小值
      maxDateTime: DateTime.now(),
      //最大值
      initialDateTime: DateTime.now(),
      //默认日期
      // dateFormat:'MM'+'月'+' '+'dd'+'日'+' '+'HH时'+'mm分',//显示时间格式
      dateFormat: 'MM-dd HH时:mm分:ss秒',

      locale: DateTimePickerLocale.zh_cn,
      pickerMode: DateTimePickerMode.datetime,
      //选择器种类
      onCancel: () {},
      onClose: () {},
      onChange: (data, i) {
        print(data);
      },
      onConfirm: (data, i) {
        print(data);
      },
    );
  }
}
