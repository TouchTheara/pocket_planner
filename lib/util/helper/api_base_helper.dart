import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:injectable/injectable.dart';

import 'local_data/get_local_data.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  update,
}

@injectable
class ApiBaseHelper extends GetConnect {
  // final String? baseurl = "${GlobalConfiguration().get("baseUrl")}";
  // final String? baseurl = dotenv.get('baseUrl');

  final String _baseUrl = 'https://pocketplaner.onrender.com/api/v1/';

  Future<dynamic> onNetworkRequesting(
      {required String url,
      bool isFullUrl = false,
      Map<String, String>? header,
      Map<String, dynamic>? body,
      required METHODE? methode,
      required bool isAuthorize,
      bool isConvertToByte = false}) async {
    final token = await LocalDataStorage.getCurrentUser();

    final fullUrl = isFullUrl ? url : _baseUrl + url;
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize ? 'Bearer $token' : ""
    };

    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(fullUrl, headers: header).timeout(
            const Duration(seconds: 30),
            onTimeout: () {
              // Time has run out, do what you wanted to do.
              return Future.error(const ErrorModel(
                  statusCode: 408, bodyString: {"message": "Request Timeout"}));
            },
          );
          return _returnResponse(response, isConvertToByte);
        case METHODE.post:
          if (body != null) {
            final response =
                await post(fullUrl, json.encode(body), headers: header);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        case METHODE.delete:
          final response = await delete(fullUrl, headers: header);
          return _returnResponse(response, isConvertToByte);
        case METHODE.update:
          if (body != null) {
            final response =
                await put(fullUrl, json.encode(body), headers: header);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        default:
          break;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response, bool isReturnBytes) {
    switch (response.statusCode) {
      case 200:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? '')));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 401:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 500:
        break;
      default:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString ?? '')));
    }
  }
}
