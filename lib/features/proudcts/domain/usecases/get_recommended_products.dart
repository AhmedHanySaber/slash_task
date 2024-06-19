import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetRecommendedProducts {
  final ProductRepository repository;

  GetRecommendedProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getRecommendedProducts();
  }
}
