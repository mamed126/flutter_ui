import 'package:flutter/material.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("News headline"),
          onTap: () {
            Get.toNamed("/news");
          },
          leading: Icon(Icons.contact_page),
        ),
        ListTile(
          title: Text("Search news"),
          onTap: () {
            Get.toNamed("/search");
          },
          leading: Icon(Icons.contact_page),
        ),
      ],
    ),
  );
}
