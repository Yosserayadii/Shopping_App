import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingproj/ShoopingCartProvider.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<ShoppingCartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartProvider.cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('${item.price.toStringAsFixed(2)} DT'),
            leading: Image.network(item.image),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<ShoppingCartProvider>().removeFromCart(item);
              },
            ),
          );
        },
      ),
    );
  }
}
