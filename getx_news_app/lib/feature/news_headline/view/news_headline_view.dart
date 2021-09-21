import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/widgets/drawer_widget.dart';
import 'package:getx_news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _c = Get.find<NewsHeadlineController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("News head line"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return _c.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (c, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(_c.articles![i].title!)],
                      );
                    },
                    separatorBuilder: (c, i) => Divider(),
                    itemCount: _c.articles!.length),
              );
      }),
    );
  }
}
