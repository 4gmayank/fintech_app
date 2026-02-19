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
            if (state is ProductInitial) {
              context.read<ProductBloc>().add(GetProduct());
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 80, maxHeight: 80),
                child: Image.network(
                  item.imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                        Icons.error); // Widget to display on error
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    item.description,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
