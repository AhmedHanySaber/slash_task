import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<Product> products;

  const ProductList({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: Column(
                  children: [
                    Image.asset(product.image, width: 100, height: 100),
                    Text(product.name),
                    Text('\$${product.price.toString()}'),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}