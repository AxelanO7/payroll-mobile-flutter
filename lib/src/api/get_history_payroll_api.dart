import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class GetHistoryPayrollApi extends BaseApi {
  @override
  String url = '${CoreConfig.getApiUrl()}/recap-salary';

  Future<ResultApi> request({required String teacherId}) async {
    url += '/$teacherId';
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetPayrollResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.listData = data.data;
        responseData.message = data.message;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
