part of 'recommended_bloc.dart';

abstract class RecommendedEvent extends Equatable {
  const RecommendedEvent();

  @override
  List<Object> get props => [];
}

class LoadRecommendedProducts extends RecommendedEvent {}
