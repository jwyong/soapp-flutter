import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String _baseUrl = "https://itunes.apple.com/search?term=";

  // http get call
  // Future<dynamic> get(String url) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http.get(_baseUrl + url);
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  // @visibleForTesting
  // dynamic returnResponse(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //     case 401:
  //     case 403:
  //       throw UnauthorisedException(response.body.toString());
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //           'Error occured while communication with server' +
  //               ' with status code : ${response.statusCode}');
  //   }
  // }
}
