import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import '../models/product.model.dart';
import '../repo/products.repo.dart';

part 'products_event.dart';
part 'products_state.dart';

// ? ** Call The Classes(Event) & State,
// ? ** Whatever Give The Name Like Mine Event Name Is "ProductLoadedEvent"
// ? ** And State Name Is ProductLoadedState .

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductRepo productRepo;
  ProductsBloc(this.productRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>(
      (event, emit) async {
        // ! ** Call Here What Ever You Want To Call

        // ? **** -------> Now We Can Call Api in Two Ways Is Below <------- **** ?//
        try {
          emit(ProductsLoadingState());
          var dataResponse = await productRepo.getProducts();

          emit(ProductsLoadedState(dataResponse));
        } catch (e) {
          emit(ProductsErrorState(e.toString()));
        }

// **** -------> Now We Can Call Api in Two Ways Is Below "Which Is Commented" <------- ****//
        // try {
        //   emit(ProductsLoadingState());

        //   var endPointUrl = "https://fakestoreapi.com/products";
        //   var response = await http.get(Uri.parse(endPointUrl));
        //   if (response.statusCode == 200) {
        //     emit(ProductsLoadedState(userProductsFromJson(response.body)));
        //   } else {
        //     throw ("Faild To Load The User Products");
        //   }
        // } catch (e) {
        //   emit(ProductsErrorState(e.toString()));
        // }
      },
    );
  }
}
