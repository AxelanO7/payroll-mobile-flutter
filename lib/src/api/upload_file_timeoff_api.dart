import 'dart:convert';
import 'dart:io';

import 'package:absent_payroll/src/core/base_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:http/http.dart' as http;

class UploadFileTimeoffApi extends BaseApi {
  @override
  String url = '${CoreConfig.getApiUrl()}/upload/timeoff';

  Future<ResultApi> request({required File file}) async {
    try {
      requestHeaders['Content-Type'] = 'multipart/form-data';
      await generateHeader();

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(requestHeaders);
      var multipartFile = http.MultipartFile.fromPath(
        'file',
        file.path,
      );
      request.files.add(await multipartFile);
      http.StreamedResponse response = await request.send();

      responseData.statusCode = response.statusCode;
      if (await checkStatus200X(response)) {
        var responseBody = json.decode(await response.stream.bytesToString());
        var data = UploadFilePresenceResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data.data;
        responseData.message = "File berhasil diupload";
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
