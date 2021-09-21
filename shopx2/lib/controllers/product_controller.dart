import 'package:get/state_manager.dart';
import 'package:shopx2/models/product_model.dart';
import 'package:shopx2/services/product_remote_service.dart';

class ProductController extends GetxController {
  List<Product> products = List<Product>.generate(0, (index) {
    return Product();
  }).obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var _products = await ProductService.getProducts();

    products.addAll(_products);
  }
}
