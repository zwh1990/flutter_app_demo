import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/constant/string.dart';
import 'package:flutter_app_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_demo/https/shared_preferences_util.dart';

var dio;

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();

  static HttpUtil _httpUtil;

  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  HttpUtil() {
    BaseOptions options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
    );
    dio = new Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("========================请求数据===================");
      print("url=${options.uri.toString()}");
      print("params=${options.data}");
      dio.lock();
      await SharedPreferencesUtils.getToken().then((token) {
        options.headers[Strings.TOKEN] = token;
      });
      dio.unlock();
      return options;
    }, onResponse: (Response response) {
      print("========================请求数据===================");
      print("code=${response.statusCode}");
      print("response=${response.data}");
    }, onError: (DioError error) {
      print("========================请求错误===================");
      print("message =${error.message}");
    }));
  }

  Future get(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response =
          await dio.get(url, queryParameters: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.get(url, queryParameters: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  Future post(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    return response.data;
  }

  static responseJsonParse<T>(
    String url,
    BuildContext context,String content
  ) async {
    try {
      _showLoadingDialog(context,content);
      var response = await HttpUtil.instance.post(url);
      /// 关闭弹窗
      Navigator.pop(context);
      print("返回数据是:" + response.toString());
      if (response['code'].contains("0")) {
        //请求成功，进行json 解析
        if (response['result'] is String) {
          print("无解析");
          return response['result'];
        } else {
          print("解析list");
          return JsonConvert.fromJsonAsT<T>(response['result']);
        }
      } else {
        print("返回null");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  static _showLoadingDialog(BuildContext context,String content) {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text(content),
              )
            ],
          ),
        );
      },
    );
  }
}
