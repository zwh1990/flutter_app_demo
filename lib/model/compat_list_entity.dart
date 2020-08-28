import 'package:flutter_app_demo/generated/json/base/json_convert_content.dart';

class CompatListEntity with JsonConvert<CompatListEntity> {
	String count;
	String totalPage;
	List<dynamic> data;
}
