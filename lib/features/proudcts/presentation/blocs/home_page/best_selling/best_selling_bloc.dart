import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/get_best_selling_proudcts.dart';

part 'best_selling_event.dart';
part 'best_selling_state.dart';

class BestSellingBloc extends Bloc<BestSellingEvent, BestSellingState> {
  final GetBestSellingProducts getBestSellingProducts;

  BestSellingBloc(this.getBestSellingProducts) : super(BestSellingInitial()) {
    on<LoadBestSellingProducts>((event, emit) async {
      emit(BestSellingLoading());
      try {
        final products = await getBestSellingProducts();
        emit(BestSellingLoaded(products));
      } catch (e) {
        emit(BestSellingError(e.toString()));
      }
    });
  }
}
