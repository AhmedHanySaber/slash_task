// injection.dart
import 'package:get_it/get_it.dart';

import 'features/proudcts/data/repositories/product_repository_impl.dart';
import 'features/proudcts/domain/repositories/product_repository.dart';
import 'features/proudcts/domain/usecases/get_best_selling_proudcts.dart';
import 'features/proudcts/domain/usecases/get_new_arrival_products.dart';
import 'features/proudcts/domain/usecases/get_recommended_products.dart';
import 'features/proudcts/presentation/blocs/home_page/best_selling/best_selling_bloc.dart';
import 'features/proudcts/presentation/blocs/home_page/new_arrival/new_arrival_bloc.dart';
import 'features/proudcts/presentation/blocs/home_page/recommended/recommended_bloc.dart';



final sl = GetIt.instance;

void init() {
  // Blocs
  sl.registerFactory(() => BestSellingBloc(sl()));
  sl.registerFactory(() => NewArrivalBloc(sl()));
  sl.registerFactory(() => RecommendedBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetBestSellingProducts(sl()));
  sl.registerLazySingleton(() => GetNewArrivalProducts(sl()));
  sl.registerLazySingleton(() => GetRecommendedProducts(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
}
