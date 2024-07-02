import 'dart:convert';
import 'dart:io';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class UploadFileTimeoffApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/timeoff';

  Future<ResultApi> request({
    required String acceptedBy,
    required String employeeId,
    required String type,
    required String startDate,
    required String endDate,
    required String description,
    required File document,
  }) async {
    requestPayload = {
      "accepted_by": acceptedBy,
      "employee_id": employeeId,
      "type": type,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "document": document,
    };
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await post(Uri.parse(url), headers: requestHeaders, body: requestPayload);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        // var data = CheckCodeResponse.fromJson(responseBody);
        // responseData.status = true;
        // responseData.data = data.data;
        // responseData.message = data.message.first;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
