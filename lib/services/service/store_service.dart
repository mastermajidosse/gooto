import 'package:gooto/models/product_model.dart';
import 'package:gooto/services/api/api.dart';

class StoreService {
  static final StoreService _storeService = StoreService._internal();

  factory StoreService() {
    return _storeService;
  }

  StoreService._internal();
  Api api = Api();
  product? products;

  Future<product> getProducts(int page) async {
    var result = await api.httpGetNoT("v1/products");
    products = product.fromJson(result);
    // nextPage = result['links']['next'] != null ? true : false;

    return products!;
  }
}
