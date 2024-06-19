part of 'best_selling_bloc.dart';

abstract class BestSellingEvent extends Equatable {
  const BestSellingEvent();

  @override
  List<Object> get props => [];
}

class LoadBestSellingProducts extends BestSellingEvent {}
