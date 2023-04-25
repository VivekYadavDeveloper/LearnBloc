part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

// ! ** In BLOC State Section Is Use For Whatever You Want To Show ,In The
// ! ** Application Before Showed The API Data , etc. That Call The Data Like Eg. Circural Progress Bar ,
// ! ** Logo Anything Thats Call The State Class.

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

// ? ** This State Is Use For Whatever You Want To Load Call Here.
// ? ** Like I'm Call List Of Data Which Is Call From Api Model.
// ? ** Because My Api is Calling Data in List Formate.
class ProductsLoadedState extends ProductsState {

  // ** --> Model Data List
  final List<UserProducts> productsModels;

  const ProductsLoadedState(this.productsModels);
  @override
  List<Object> get props => [productsModels];
}

// ? ** Showing Error Message
class ProductsErrorState extends ProductsState {
  final String errorMessage;
  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
