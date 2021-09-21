import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopx2/controllers/product_controller.dart';
import 'package:shopx2/widgets/product_detail_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  ProductController _pc = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
              onPressed: () {
                _pc.getProducts();
              },
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Shop x",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
              child: Obx(
            () => StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: _pc.products.length,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemBuilder: (context, index) {
                return ProductTile(_pc.products[index]);
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          )),
        ],
      ),
    );
  }
}
