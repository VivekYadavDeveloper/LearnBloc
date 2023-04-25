import 'package:bloc_api_project/debug/app_observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/home.screen.dart';
import 'bloc/products_bloc.dart';
import 'repo/products.repo.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    RepositoryProvider(
      create: (context) => ProductRepo(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(ProductRepo()),
        )
      ],
      child: MaterialApp(
        title: 'Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
