import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech_app/data/network_api.dart';
import 'package:fintech_app/data/product_response_model.dart';
import 'package:fintech_app/domain/item_entity.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // GetProductEntityUseCase getProductEntityUseCase = null;

  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProduct) {
        // getProductEntityUseCase.call();

        Api api = Api();
        List<ProductResponseModel> productList = await api.fetchProductApis();
        List<ItemEntity> itemList = List.empty(growable: true);
        for (var productResponseModel in productList) {
          itemList.add(ItemEntity(productResponseModel.title, productResponseModel.image, productResponseModel.description));

          emit(ProductSuccess(itemList));
        }
      }
    });
  }
}
