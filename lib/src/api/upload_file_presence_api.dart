import 'dart:convert';
import 'dart:io';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:http/http.dart' as http;

class UploadFilePresenceApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/upload/presence/teacher';

  Future<ResultApi> request({required File file}) async {
    try {
      // requestHeaders['Content-Type'] = 'multipart/form-data';
      // await generateHeader();
      //
      // var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(requestHeaders);
      // var multipartFile = http.MultipartFile.fromPath(
      //   'file',
      //   file.path,
      // );
      // request.files.add(await multipartFile);
      //
      // http.StreamedResponse response = await request.send();
      //
      // responseData.statusCode = response.statusCode;
      // if (await checkStatus200X(response)) {
      //   responseData.status = true;
      //   responseData.message = "File berhasil diupload";
      // }

      var fileBlob = await http.MultipartFile.fromPath('file', file.path);
      requestPayload = {
        "file": fileBlob,
      };

      if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

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
