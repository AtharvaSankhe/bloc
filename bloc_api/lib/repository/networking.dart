import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Networking{

  Dio _dio =  Dio();

  Networking(){
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(PrettyDioLogger());

  }


  //creating a getter
  Dio get sendRequest => _dio ;

}