import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_news_app/feature/news_headline/binding/news_headline_binding.dart';
import 'package:getx_news_app/feature/news_headline/view/news_headline_view.dart';
import 'package:getx_news_app/feature/search_news/binding/search_news_bindings.dart';
import 'package:getx_news_app/feature/search_news/view/searchnews_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: "/news",
            page: () => NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: "/search",
            page: () => SearchNewsView(),
            binding: SearchNewsBinding()),
      ],
      initialRoute: "/news",
    );
  }
}
