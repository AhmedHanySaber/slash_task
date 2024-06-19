import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetNewArrivalProducts {
  final ProductRepository repository;

  GetNewArrivalProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getNewArrivalProducts();
  }
}