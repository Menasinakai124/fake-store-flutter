import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';
import 'categories_screen.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = ApiService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store'),
        actions: [
          IconButton(
              icon: Icon(Icons.category),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CategoriesScreen()));
              }),
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FavoritesScreen()));
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              }),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else if (!snapshot.hasData)
            return Center(child: Text('No products found'));

          List<Product> productList = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: product)));
                },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(child: Image.network(product.image)),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text('\$${product.price}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
