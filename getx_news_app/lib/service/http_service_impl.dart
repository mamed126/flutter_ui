import 'package:dio/dio.dart';
//import 'package:dio/src/response.dart';
import 'package:getx_news_app/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "10c40b699f3343cab428dc4871290bd1";

class HttpServiceImpl extends HttpService {
  Dio _dio = Dio();
  @override
  Future<Response> getData(String url) async {
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw e;
    }

    return response;
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}));
    initInterceptors();
  }

  initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (e, h) {
      print(e.message);
    }, onRequest: (r, h) {
      print("${r.method} || ${r.path}");
    }, onResponse: (r, h) {
      print("${r.statusCode} || ${r.statusMessage} || ${r.data}");
    }));
  }
}
