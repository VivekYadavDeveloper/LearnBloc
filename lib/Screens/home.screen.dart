
import 'package:bloc_api_project/Screens/product.screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductScreen(),
                ),
              );
            },
            child: const Text(
              "Get Products",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ));
  }
}
