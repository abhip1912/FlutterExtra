import 'package:dio/dio.dart';

class HttpService {
  Dio _dio;

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://reqres.in/',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      print("myLog: get request initiated");
      response = await _dio.get(endPoint);
      print("myLog: response is returned: $response");
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (req, requestInterceptorHandler) {
        requestInterceptorHandler.next(req);
        print("${req.method} ${req.path}");
      },
      onResponse: (resp, responseInterceptorHandler) {
        responseInterceptorHandler.next(resp);
        print(resp.data);
      },
      onError: (e, errorInterceptorHandler) {
        errorInterceptorHandler.next(e);
        print(e.message);
      },
    ));
  }
}
