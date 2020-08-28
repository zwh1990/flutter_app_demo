import 'package:flutter_app_demo/model/main_jq_entity.dart';

mainJqEntityFromJson(MainJqEntity data, Map<String, dynamic> json) {
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	return data;
}

Map<String, dynamic> mainJqEntityToJson(MainJqEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['address'] = entity.address;
	data['phone'] = entity.phone;
	return data;
}