import 'package:bloc/bloc.dart';
import 'package:gooto/models/product_model.dart';
import 'package:gooto/services/service/store_service.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreState());

  StoreService storeService = StoreService();

  late product products;

  getAllProducts() async {
    emit(StoreState(loading: true));
    try {
      products = await storeService.getProducts(0);
      emit(StoreState(loading: false, products: products));
    } catch (e) {
      print(e);
      emit(StoreState(loading: false, errorMessage: e.toString()));
    }
  }
}
