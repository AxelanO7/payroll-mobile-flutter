import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class LogoutApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/logout';

  Future<ResultApi> request() async {
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await post(Uri.parse(url), headers: requestHeaders);

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
