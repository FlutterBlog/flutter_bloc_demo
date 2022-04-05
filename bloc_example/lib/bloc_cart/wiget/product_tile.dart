import 'package:bloc_example/bloc_cart/bloc/cart_bloc.dart';
import 'package:bloc_example/bloc_cart/bloc/cart_event.dart';
import 'package:bloc_example/bloc_cart/bloc/cart_state.dart';
import 'package:bloc_example/bloc_cart/model/product.dart';
import 'package:bloc_example/bloc_cart/page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  final int itemNo;
  final List<int> cart;

  const ProductTile({this.itemNo, this.cart});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    var cartList = BlocProvider.of<CartBloc>(context).items;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductPage.routeName,
            arguments: Product('Product $itemNo', color),
          );
        },
        leading: Container(
          width: 50,
          height: 30,
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: cart.contains(itemNo)
              ? Icon(Icons.shopping_cart)
              : Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            !cart.contains(itemNo)
                ? BlocProvider.of<CartBloc>(context).add(AddProduct(itemNo))
                : BlocProvider.of<CartBloc>(context).add(RemoveProduct(itemNo));
          },
        ),
      ),
    );
  }
}
