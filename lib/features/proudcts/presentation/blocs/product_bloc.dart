import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/features/proudcts/presentation/blocs/product_event.dart';
import 'package:slash_task/features/proudcts/presentation/blocs/product_state.dart';


import '../../domain/usecases/get_products.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductLoading());
      final failureOrProducts = await getProducts();
      emit(failureOrProducts.fold(
            (failure) => ProductError(message: 'Error fetching products'),
            (products) => ProductLoaded(products: products),
      ));
    });
  }
}
