import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class SubmitTimeoffApi extends BaseApi {
  @override
  String url = '${CoreConfig.getApiUrl()}/timeoff';

  Future<ResultApi> request({
    required String teacherId,
    required String type,
    required String startDate,
    required String endDate,
    required String description,
    required String document,
  }) async {
    requestPayload = {
      "teacher_id": teacherId,
      "type": type,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "document": document,
    };
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await post(Uri.parse(url), headers: requestHeaders, body: json.encode(requestPayload));

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GeneralResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data.data;
        responseData.message = data.message;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
