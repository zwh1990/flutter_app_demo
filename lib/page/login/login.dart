import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/https/Api.dart';
import 'package:flutter_app_demo/https/http_util.dart';
import 'package:flutter_app_demo/model/user_entity.dart';
import 'package:flutter_app_demo/page/main/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State {
  TextEditingController _userControler = new TextEditingController();
  TextEditingController _passwordControler = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("登录页面"),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              controller: _userControler,
              decoration: InputDecoration(
                  labelText: "账号",
                  hintText: "请输入账号",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: Icon(Icons.lock),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                controller: _passwordControler,
                focusNode: focusNode2,
                obscureText: true),
            Builder(builder: (context) {
              return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: SizedBox(
                      height: ScreenUtil.instance.setHeight(100.0),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: _login,
                        color: Colors.deepOrangeAccent,
                        child: Text(
                          "登录",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )));
            })
          ],
        ),
      )),
    );
  }

  _login() {
    focusNode1.unfocus();
    focusNode2.unfocus();
    Future<dynamic> future =
        HttpUtil.responseJsonParse<UserEntity>(Api.LOGIN_URL,context,"正在登陆，请稍等...");
    future.then((value) => _skipMain(value));
  }

  _skipMain(value) {
    if (value != null) {
      print((value as UserEntity).name);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return new MainView();
      }));
    }
  }
}
