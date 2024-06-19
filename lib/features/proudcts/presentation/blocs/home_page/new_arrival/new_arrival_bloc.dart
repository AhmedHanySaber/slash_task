import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/get_new_arrival_products.dart';
part 'new_arrival_event.dart';
part 'new_arrival_state.dart';

class NewArrivalBloc extends Bloc<NewArrivalEvent, NewArrivalState> {
  final GetNewArrivalProducts getNewArrivalProducts;

  NewArrivalBloc(this.getNewArrivalProducts) : super(NewArrivalInitial()) {
    on<LoadNewArrivalProducts>((event, emit) async {
      emit(NewArrivalLoading());
      try {
        final products = await getNewArrivalProducts();
        emit(NewArrivalLoaded(products));
      } catch (e) {
        emit(NewArrivalError(e.toString()));
      }
    });
  }
}
