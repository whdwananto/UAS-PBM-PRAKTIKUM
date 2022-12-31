import 'package:http/http.dart' as http;
import 'package:projectuas/Model/product_model.dart';

class ProductApiServices {
  Future<Produk> fetchProductApi() async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      print(response.body);

      final Produk result = produkFromJson(response.body);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
