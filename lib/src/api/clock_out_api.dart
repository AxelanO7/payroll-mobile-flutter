import 'dart:convert';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class ClockOutApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/presence/out';

  Future<ResultApi> request({
    required String teacherId,
    required String clockOut,
    required String latitudeOut,
    required String longitudeOut,
    required String photoOut,
  }) async {
    url += '?teacher_id=$teacherId';

    requestPayload = {
      "clock_out": clockOut,
      "latitude_out": latitudeOut,
      "longitude_out": longitudeOut,
      "photo_out": photoOut,
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
        responseData.status = true;
        // responseData.data = data.data;
        // responseData.message = data.message.first;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
