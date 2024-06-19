// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/proudcts/presentation/blocs/home_page/best_selling/best_selling_bloc.dart';
import 'features/proudcts/presentation/blocs/home_page/new_arrival/new_arrival_bloc.dart';
import 'features/proudcts/presentation/blocs/home_page/recommended/recommended_bloc.dart';
import 'features/proudcts/presentation/pages/Home_page.dart';
import 'injection.dart' as di;


void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<BestSellingBloc>()..add(LoadBestSellingProducts()),
        ),
        BlocProvider(
          create: (context) => di.sl<NewArrivalBloc>()..add(LoadNewArrivalProducts()),
        ),
        BlocProvider(
          create: (context) => di.sl<RecommendedBloc>()..add(LoadRecommendedProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Product App',
        home: HomePage(),
      ),
    );
  }
}
