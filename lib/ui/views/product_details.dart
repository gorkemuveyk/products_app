import 'package:flutter/material.dart';
import 'package:products_app/data/entity/products.dart';

class ProductDetailsPage extends StatefulWidget {
  Products products;

  ProductDetailsPage({required this.products});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.products.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("img/${widget.products.photo}"),
            Text(
              "₺${widget.products.price}",
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
