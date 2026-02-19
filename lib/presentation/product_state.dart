part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductSuccess extends ProductState {
  final List<ItemEntity> itemList;

  ProductSuccess(this.itemList);

  @override
  List<Object> get props => [itemList];
}
