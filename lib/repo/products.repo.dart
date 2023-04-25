import 'package:http/http.dart' as http;

import '../models/product.model.dart';

class ProductRepo {
  Future<List<UserProducts>> getProducts() async {
    var endPointUrl = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      return userProductsFromJson(response.body);
    } else {
      throw ("Faild To Load The User Products");
    }
  }
}
