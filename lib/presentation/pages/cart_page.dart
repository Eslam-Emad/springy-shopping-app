import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cart_cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = BlocProvider.of<CartCubit>(context).cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (BuildContext context, i) {
              return ListTile(
                title: Text(cartItems[i].product.title!),
                subtitle: Text("\$${cartItems[i].product.price}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        CartCubit.get(context).decrementItem(i);
                      },
                    ),
                    Text(cartItems[i].count.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        CartCubit.get(context).incrementItem(i);
                      },
                    ),
                  ],
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
