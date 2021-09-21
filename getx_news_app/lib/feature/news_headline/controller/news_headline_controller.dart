import 'package:get/get.dart';
import 'package:getx_news_app/core/repositories/news_repo.dart';
import 'package:getx_news_app/core/repositories/news_repo_impl.dart';
import 'package:getx_news_app/core/models/article.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo? _repo;

  NewsHeadlineController() {
    _repo = Get.find<NewsRepoImpl>();
    loadNews();
  }

  RxList<Article>? articles;

  loadNews() async {
    showLoading();
    var res = await _repo!.getNewsHeadline();
    hideLoading();
    articles = res.obs;
  }

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
