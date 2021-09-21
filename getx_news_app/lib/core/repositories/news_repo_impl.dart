import 'package:get/get.dart';
import 'package:getx_news_app/core/models/article.dart';
import 'package:getx_news_app/core/models/news_response_model.dart';
import 'package:getx_news_app/core/repositories/news_repo.dart';
import 'package:getx_news_app/service/http_service.dart';
import 'package:getx_news_app/service/http_service_impl.dart';

class NewsRepoImpl extends NewsRepo {
  HttpService? _service;

  NewsRepoImpl() {
    _service = Get.put(HttpServiceImpl());

    _service?.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    var emptyResult = List.generate(0, (index) => Article());
    //try {
    var response = await _service!.getData("/v2/top-headlines?country=us");
    var parsedResponse = NewsResponse.fromJson(response.data);
    return parsedResponse.articles ?? emptyResult;
    /*
    } on Exception catch (e) {
      print(e);
      return emptyResult;
    }
    */
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    var emptyResult = List.generate(0, (index) => Article());
    try {
      var response = await _service!.getData("/v2/everything?q=$query");
      var parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles ?? emptyResult;
    } on Exception catch (e) {
      print(e);
      return emptyResult;
    }
  }
}
