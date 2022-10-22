part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadBestSellerProductEvent extends ProductEvent {}

class LoadAllProductEvent extends ProductEvent {}

class LoadCoffeeEvent extends ProductEvent {}

class LoadTeaEvent extends ProductEvent {}

class LoadCakeEvent extends ProductEvent {}

class LoadBestSellerEvent extends ProductEvent {}

class AddKeyFilterPrice extends ProductEvent {
  final String price;

  const AddKeyFilterPrice(this.price);

  @override
  List<Object> get props => [price];
}

class AddKeyFilterCateg extends ProductEvent {
  final String categ;

  const AddKeyFilterCateg(this.categ);

  @override
  List<Object> get props => [categ];
}

class ChangedSearchEvent extends ProductEvent {
  final String keyword;

  const ChangedSearchEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class FilterProductEvent extends ProductEvent {}

class ResetList extends ProductEvent {}
