import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/order_cubit.dart';
import 'pages/order_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Warung Makan App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OrderHomePage(),
      ),
    );
  }
}
