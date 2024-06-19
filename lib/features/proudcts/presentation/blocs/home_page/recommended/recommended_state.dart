part of 'recommended_bloc.dart';

abstract class RecommendedState extends Equatable {
  const RecommendedState();

  @override
  List<Object> get props => [];
}

class RecommendedInitial extends RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedLoaded extends RecommendedState {
  final List<Product> products;

  const RecommendedLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class RecommendedError extends RecommendedState {
  final String message;

  const RecommendedError(this.message);

  @override
  List<Object> get props => [message];
}