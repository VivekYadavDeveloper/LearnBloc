import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            const Center(
              child: CircularProgressIndicator.adaptive(strokeWidth: 4),
            );
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
              itemCount: state.productsModels.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          state.productsModels[index].image.toString()),
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
