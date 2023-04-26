import 'package:bloc_api_project/cubit/users_cubit.dart';
import 'package:bloc_api_project/debug/app_observer.dart';
import 'package:bloc_api_project/repo/users.repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/home.screen.dart';
import 'bloc/products_bloc.dart';
import 'repo/products.repo.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepo(),
        ),
        RepositoryProvider(
          create: (context) => UsersRepo(),
        ),
      ],
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
        ),
        BlocProvider(
          create: (context) => UsersCubit(UsersRepo()),
        ),
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
