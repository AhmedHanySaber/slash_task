import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/get_recommended_products.dart';

part 'recommended_event.dart';
part 'recommended_state.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  final GetRecommendedProducts getRecommendedProducts;

  RecommendedBloc(this.getRecommendedProducts) : super(RecommendedInitial()) {
    on<LoadRecommendedProducts>((event, emit) async {
      emit(RecommendedLoading());
      try {
        final products = await getRecommendedProducts();
        emit(RecommendedLoaded(products));
      } catch (e) {
        emit(RecommendedError(e.toString()));
      }
    });
  }
}