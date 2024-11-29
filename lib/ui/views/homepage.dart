import 'package:flutter/material.dart';
import 'package:products_app/data/entity/products.dart';
import 'package:products_app/ui/views/product_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<Products>> loadProducts() async {
    var productList = <Products>[];
    var p1 = Products(
        id: 1, name: "Macbook Pro 14", photo: "bilgisayar.png", price: 43950);
    var p2 = Products(
        id: 2, name: "Rayban Club Master", photo: "gozluk.png", price: 2500);
    var p3 = Products(
        id: 3, name: "Sony ZX Series", photo: "kulaklik.png", price: 40000);
    var p4 =
        Products(id: 4, name: "Gio Armani", photo: "parfum.png", price: 2000);
    var p5 =
        Products(id: 5, name: "Casio X Series", photo: "saat.png", price: 8000);
    var p6 =
        Products(id: 6, name: "Dyson V8", photo: "supurge.png", price: 18000);
    var p7 =
        Products(id: 7, name: "iPhone 13", photo: "telefon.png", price: 32000);
    productList.add(p1);
    productList.add(p2);
    productList.add(p3);
    productList.add(p4);
    productList.add(p5);
    productList.add(p6);
    productList.add(p7);
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products App"),
      ),
      body: FutureBuilder<List<Products>>(
        future: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var productList = snapshot.data;
            return ListView.builder(
              itemCount: productList?.length,
              itemBuilder: (context, index) {
                var product = productList?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(products: product),
                        ));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 128,
                              height: 128,
                              child: Image.asset("img/${product?.photo}")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product!.name),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "₺${product.price}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  print("${product.name} added");
                                },
                                child: const Text("Add to cart"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text("not found");
          }
        },
      ),
    );
  }
}
