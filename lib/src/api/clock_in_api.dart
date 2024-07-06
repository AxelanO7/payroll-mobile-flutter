import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class ClockInApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/presence/in';

  Future<ResultApi> request({
    required String employeeId,
    required String clockIn,
    required String ipAddress,
    required String device,
    required String latitudeIn,
    required String longitudeIn,
    required String photoIn,
  }) async {
    url += '?teacher_id=$employeeId';

    requestPayload = {
      "clock_in": clockIn,
      "ip_address": ipAddress,
      "device": device,
      "latitude_in": latitudeIn,
      "longitude_in": longitudeIn,
      "photo_in": photoIn,
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
