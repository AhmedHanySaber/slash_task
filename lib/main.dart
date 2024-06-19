import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/proudcts/data/datasources/product_local_data_source.dart';
import 'features/proudcts/data/repositories/product_repository_impl.dart';
import 'features/proudcts/domain/repositories/product_repository.dart';
import 'features/proudcts/domain/usecases/get_products.dart';
import 'features/proudcts/presentation/blocs/product_bloc.dart';
import 'features/proudcts/presentation/blocs/product_event.dart';
import 'features/proudcts/presentation/pages/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductLocalDataSource>(
          create: (context) => ProductLocalDataSourceImpl(),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryImpl(
            localDataSource: context.read<ProductLocalDataSource>(),
          ),
        ),
        RepositoryProvider<GetProducts>(
          create: (context) => GetProducts(
            context.read<ProductRepository>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ProductBloc>(
                create: (context) => ProductBloc(
                  getProducts: context.read<GetProducts>(),
                )..add(GetProductsEvent()),
              ),
            ],
            child: MaterialApp(
              title: 'E-Commerce App',
              home: ProductPage(),
            ),
          );
        },
      ),
    );
  }
}
