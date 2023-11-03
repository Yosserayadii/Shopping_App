import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingproj/Cart.dart';
import 'package:shoppingproj/Models/Products.dart'; // Import your product model
import 'package:shoppingproj/ShoopingCartProvider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShoppingCartScreen(),
              ));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price.toStringAsFixed(2)} DT'),
            leading: Image.network(product.image),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<ShoppingCartProvider>().addToCart(product);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Product Added'),
                      content: Text('${product.name} has been added to the cart.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
