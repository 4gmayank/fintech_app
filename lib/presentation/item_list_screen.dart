import 'package:fintech_app/domain/item_entity.dart';
import 'package:fintech_app/presentation/product_bloc.dart';
import 'package:flutter/material.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {}
            ,
            builder: (context, state) {


            }
        ) ;
    }

  Widget productList(List<ItemEntity> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, itemIndex) {
          return component(items[itemIndex]);
        });
  }

  Widget component(ItemEntity item) {
    return Row(
      children: [
        // Image(image: ImageProvider),//item.fetchImageUrl()
        Column(
          children: [
            Text(item.title),
            Text(item.description),
          ],
        ),
      ],
    );
  }
}
