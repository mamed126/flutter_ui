import 'package:flutter/material.dart';
import 'package:getx_news_app/core/widgets/drawer_widget.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search news"),
      ),
      drawer: getAppDrawer(),
      body: Container(),
    );
  }
}
