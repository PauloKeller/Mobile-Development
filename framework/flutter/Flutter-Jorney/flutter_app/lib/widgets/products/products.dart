import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

import 'product_card.dart';
import 'package:flutter_app/scoped_models/scoped_models.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCard = Center(
      child: Text('No products found please add some!'),
    );

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCard = Container(); // For rendering nothing
    }

    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );
  }
}
