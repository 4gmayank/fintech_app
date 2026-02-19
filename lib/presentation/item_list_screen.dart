import 'package:fintech_app/domain/item_entity.dart';
import 'package:fintech_app/presentation/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductSuccess) {
              return productList(state.itemList);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
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
