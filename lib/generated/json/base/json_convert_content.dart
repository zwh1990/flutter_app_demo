// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_app_demo/model/main_jq_entity.dart';
import 'package:flutter_app_demo/generated/json/main_jq_entity_helper.dart';
import 'package:flutter_app_demo/model/user_entity.dart';
import 'package:flutter_app_demo/generated/json/user_entity_helper.dart';
import 'package:flutter_app_demo/model/compat_list_entity.dart';
import 'package:flutter_app_demo/generated/json/compat_list_entity_helper.dart';
import 'package:flutter_app_demo/model/jq_detail_entity.dart';
import 'package:flutter_app_demo/generated/json/jq_detail_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case MainJqEntity:
			return mainJqEntityFromJson(data as MainJqEntity, json) as T;			case UserEntity:
			return userEntityFromJson(data as UserEntity, json) as T;			case CompatListEntity:
			return compatListEntityFromJson(data as CompatListEntity, json) as T;			case JqDetailEntity:
			return jqDetailEntityFromJson(data as JqDetailEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case MainJqEntity:
			return mainJqEntityToJson(data as MainJqEntity);			case UserEntity:
			return userEntityToJson(data as UserEntity);			case CompatListEntity:
			return compatListEntityToJson(data as CompatListEntity);			case JqDetailEntity:
			return jqDetailEntityToJson(data as JqDetailEntity);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'MainJqEntity':
			return MainJqEntity().fromJson(json);			case 'UserEntity':
			return UserEntity().fromJson(json);			case 'CompatListEntity':
			return CompatListEntity().fromJson(json);			case 'JqDetailEntity':
			return JqDetailEntity().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'MainJqEntity':
			return List<MainJqEntity>();			case 'UserEntity':
			return List<UserEntity>();			case 'CompatListEntity':
			return List<CompatListEntity>();			case 'JqDetailEntity':
			return List<JqDetailEntity>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}