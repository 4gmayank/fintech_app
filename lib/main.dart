import 'package:fintech_app/presentation/item_list_screen.dart';
import 'package:fintech_app/presentation/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart';

void main() {

  di();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          // create: (context) => ProductBloc(sl()), child: const ItemListScreen()),
          create: (context) => ProductBloc(),
          child: const ItemListScreen()),
    );
  }
}
