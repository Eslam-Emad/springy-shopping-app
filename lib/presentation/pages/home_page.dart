import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:springy_shopp/application/cart_cubit/cart_cubit.dart';
import 'package:springy_shopp/presentation/routes/routes.dart';

import '../../application/home_cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Springy Shopping App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, Routes.cart),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, i) {
                return ListTile(
                  title: Text(state.products[i].title!.toString()),
                  subtitle: Text("\$${state.products[i].price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .addToCar(state.products[i]);
                    },
                  ),
                  onTap: () {},
                );
              },
            );
          } else {
            return Center(child: Text(state.props.first.toString()));
          }
        },
      ),
    );
  }
}
