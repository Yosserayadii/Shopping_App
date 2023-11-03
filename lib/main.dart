import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingproj/Cart.dart';
import 'package:shoppingproj/ListShooping.dart';
import 'package:shoppingproj/ShoopingCartProvider.dart'; // Import the provider package

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingCartProvider(), // Create and provide your custom provider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductListScreen(),
    );
  }
}
