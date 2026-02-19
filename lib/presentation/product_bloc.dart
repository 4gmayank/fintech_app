import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech_app/domain/get_products_use_case.dart';
import 'package:fintech_app/domain/item_entity.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductEntityUseCase getProductEntityUseCase;

  ProductBloc(this.getProductEntityUseCase) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      if (event is GetProduct) {
        getProductEntityUseCase.call();
      }
    });
  }
}
