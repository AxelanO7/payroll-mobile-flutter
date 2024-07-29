import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class GeneratePdfSalaryApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/recap-salary';

  Future<ResultApi> request({required String employeeId, required int month}) async {
    url += '/$employeeId/download?m=$month';
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GeneratePayrollUrlResponse.fromJson(responseBody);
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
