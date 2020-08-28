import 'package:flutter_app_demo/model/compat_list_entity.dart';

compatListEntityFromJson(CompatListEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toString();
	}
	if (json['totalPage'] != null) {
		data.totalPage = json['totalPage']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<dynamic>();
		data.data.addAll(json['data']);
	}
	return data;
}

Map<String, dynamic> compatListEntityToJson(CompatListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['totalPage'] = entity.totalPage;
	if (entity.data != null) {
		data['data'] =  [];
	}
	return data;
}