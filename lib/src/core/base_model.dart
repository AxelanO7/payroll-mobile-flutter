import '../models/index.dart';

class BaseModel {}

class ResultApi {
  dynamic data;
  List<dynamic>? listData;
  late bool status;
  String? message;
  late int statusCode;
  Errors? errors;
  Map<String,List<dynamic>>? errorsMessage;
  ResultApi({this.message, this.status = false, this.listData, this.data, this.statusCode = 0});//, this.errors});
}
