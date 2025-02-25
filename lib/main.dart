import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hard_stock/app/features/products/bloc/products_bloc.dart';
import 'package:hard_stock/app/features/products/presentation/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/products",
      routes: {
        '/products':
            (_) => BlocProvider(
              create: (_) => ProductsBloc(),
              child: ProductsPage(),
            ),
      },
    );
  }
}
