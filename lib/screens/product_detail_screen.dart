import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product.image, height: 250),
            SizedBox(height: 16),
            Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(product.category, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text('\$${product.price}', style: TextStyle(fontSize: 22, color: Colors.green)),
            SizedBox(height: 8),
            Text(product.description),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  icon: Icon(favoriteProvider.isFavorite(product.id)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  label: Text('Favorite'),
                  onPressed: () {
                    favoriteProvider.isFavorite(product.id)
                        ? favoriteProvider.removeFromFavorite(product.id)
                        : favoriteProvider.addToFavorite(product);
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(cartProvider.isInCart(product.id)
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart),
                  label: Text(cartProvider.isInCart(product.id) ? 'Remove' : 'Add to Cart'),
                  onPressed: () {
                    cartProvider.isInCart(product.id)
                        ? cartProvider.removeFromCart(product.id)
                        : cartProvider.addToCart(product);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
