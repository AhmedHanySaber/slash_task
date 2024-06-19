

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetBestSellingProducts {
  final ProductRepository repository;

  GetBestSellingProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getBestSellingProducts();
  }
}