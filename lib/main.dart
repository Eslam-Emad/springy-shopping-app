import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:springy_shopp/application/cart_cubit/cart_cubit.dart';
import 'package:springy_shopp/application/home_cubit/home_cubit.dart';
import 'package:springy_shopp/presentation/pages/home_page.dart';
import 'package:springy_shopp/presentation/routes/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()..getProducts()),
        BlocProvider<CartCubit>(create: (context) =>  CartCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const HomePage(),
      ),
    );
  }
}
