import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/widgets/CompatTextFieldView.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

/*
警情详情录入页面
 */
class JqInputView extends StatefulWidget {
  @override
  _JqInputViewState createState() => new _JqInputViewState();
}

const String MIN_DATETIME = '1920-01-01 00:00:00';
const String MAX_DATETIME = '2120-12-31 24:59:59';

class _JqInputViewState extends State {
  Divider divider =
      new Divider(color: Colors.grey, height: 0.5, thickness: 0.5);

  DateTime _dateTime = null;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _sfzhController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                          (_dateTime == null)
                              ? "请选择开始时间"
                              : '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')} ${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
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
              divider,
              CompatTextFieldView(
                  controler: _nameController, title: "姓名:", hint: "请输入姓名"),
              divider,
              CompatTextFieldView(
                  controler: _sfzhController,
                  title: "身份证号码:",
                  hint: "请输入身份证号码"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            String name = _nameController.text.toString();
            String sfzhm = _sfzhController.text.toString();
            print("name --->" + name);
            print("sfzhm --->" + sfzhm);
          },
        ));
  }

  /**
   * 选择时间
   */
  _selectTime() {
    print("选择时间");
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_DATETIME),
      //最小值
      maxDateTime: DateTime.parse(MAX_DATETIME),
      //最大值
      initialDateTime: DateTime.now(),
      //默认日期
      dateFormat: 'yyyy-MM-dd HH:mm:ss',

      locale: DateTimePickerLocale.zh_cn,
      pickerMode: DateTimePickerMode.datetime,
      //选择器种类
      onCancel: () {},
      onClose: () {},
      onChange: (data, i) {
        setState(() {
          _dateTime = data;
        });
      },
      onConfirm: (data, i) {
        setState(() {
          _dateTime = data;
        });
      },
    );
  }
}
