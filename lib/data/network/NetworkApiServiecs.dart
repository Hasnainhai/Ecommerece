import 'dart:convert';
import 'dart:io';
import 'package:ecommerece/data/app_excenptions.dart';
import 'package:ecommerece/data/network/BaseApiServices.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw SocketException(response.body.toString());
      case 404:
        throw UnAuthorizeException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occure while communicating with server ' +
                'with statis code' +
                response.statusCode.toString());
    }
  }
}
