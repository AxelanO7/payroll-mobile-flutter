import 'dart:convert';
import 'dart:io';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class UploadFilePresenceApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/upload/presence/employee';

  Future<ResultApi> request({required File file}) async {
    requestPayload = {
      "file": file,
    };
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await post(Uri.parse(url), headers: requestHeaders, body: json.encode(requestPayload));

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
