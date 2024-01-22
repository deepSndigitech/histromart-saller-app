import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart';
import '../Widget/jwtkeySecurity.dart';
import 'Constant.dart';
import 'package:dio/dio.dart' as dio_;
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  ApiException(this.errorMessage);

  String errorMessage;
//
  @override
  String toString() {
    return errorMessage;
  }
}

class ApiBaseHelper {
  Future<void> downloadFile(
      {required String url,
      required dio_.CancelToken cancelToken,
      required String savePath,
      required Function updateDownloadedPercentage}) async {
    try {
      final dio_.Dio dio = dio_.Dio();
      await dio.download(url, savePath, cancelToken: cancelToken,
          onReceiveProgress: ((count, total) {
        updateDownloadedPercentage((count / total) * 100);
      }));
    } on dio_.DioException catch (e) {
      if (e.type == dio_.DioExceptionType.connectionError) {
        throw ApiException('No Internet connection');
      }
      throw ApiException('Failed to download file');
    } catch (e) {
      throw Exception('Failed to download file');
    }
  }

  Future makeApiRequest() async {
    // Get the token

    // Define your API endpoint
    String apiUrl =
        'https://p3solutions.in/histomart/seller/app/v1/api/generate_token';

    // Make a GET request with the token in the Authorization header
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        // Handle the successful response
        print('API response: ${response.body}');

        return jsonDecode(response.body);
      } else {
        // Handle the error response
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      print('Error making API request: $error');
    }
  }

  Future<dynamic> postAPICall(Uri url, Map parameter) async {
    var token = await makeApiRequest();
    var responseJson;
    print("parameter : $parameter");
    print("url : $url");
    print("headersheadersheaders : $token");
    try {
      final response = await post(
        url,
        body: parameter.isNotEmpty ? parameter : null,
        headers: {
          "Authorization": 'Bearer ${token}',
        },
      ).timeout(
        const Duration(
          seconds: timeOut,
        ),
      );
      print("response : ${response.body.toString()}");

      print(
          "Parameter = $parameter , API = $url,response : ${response.body.toString()}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}
