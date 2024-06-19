// presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_page/best_selling/best_selling_bloc.dart';
import '../blocs/home_page/new_arrival/new_arrival_bloc.dart';
import '../blocs/home_page/recommended/recommended_bloc.dart';
import '../widgets/product_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product App')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<BestSellingBloc, BestSellingState>(
              builder: (context, state) {
                if (state is BestSellingLoading) {
                  return CircularProgressIndicator();
                } else if (state is BestSellingLoaded) {
                  return ProductList(title: 'Best Selling', products: state.products);
                } else if (state is BestSellingError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
            BlocBuilder<NewArrivalBloc, NewArrivalState>(
              builder: (context, state) {
                if (state is NewArrivalLoading) {
                  return CircularProgressIndicator();
                } else if (state is NewArrivalLoaded) {
                  return ProductList(title: 'New Arrivals', products: state.products);
                } else if (state is NewArrivalError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
            BlocBuilder<RecommendedBloc, RecommendedState>(
              builder: (context, state) {
                if (state is RecommendedLoading) {
                  return CircularProgressIndicator();
                } else if (state is RecommendedLoaded) {
                  return ProductList(title: 'Recommended For You', products: state.products);
                } else if (state is RecommendedError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}