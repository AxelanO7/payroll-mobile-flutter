import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class LoginApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/login';

  Future<ResultApi> request({required String email, required String password}) async {
    requestPayload = {
      "email": email,
      "password": password,
    };
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader();

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
