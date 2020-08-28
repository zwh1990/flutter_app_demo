import 'package:flutter_app_demo/model/jq_detail_entity.dart';

jqDetailEntityFromJson(JqDetailEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['ajbh'] != null) {
		data.ajbh = json['ajbh']?.toString();
	}
	if (json['sfzh'] != null) {
		data.sfzh = json['sfzh']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toString();
	}
	return data;
}

Map<String, dynamic> jqDetailEntityToJson(JqDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['ajbh'] = entity.ajbh;
	data['sfzh'] = entity.sfzh;
	data['sex'] = entity.sex;
	return data;
}