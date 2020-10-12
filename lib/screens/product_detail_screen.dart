import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    // listen: false говорит, что нам нуно всего лишь 1 раз получить эти данные.
    // listen: false отлично подходит для получения id и самого товара
    // на странице этого товара. То есть на странице product_detail_screen.dart
    final loadedProduct = Provider.of<Products>(context, listen: false).findById(
        productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
