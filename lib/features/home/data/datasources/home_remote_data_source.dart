import '../models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    // هنا بيحصل الاتصال بالـ API لجلب المنتجات
    return [];
  }
}
