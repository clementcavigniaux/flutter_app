import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/products.dart';
import 'package:redux/redux.dart';

Reducer<Products> productsReducer = combineReducers([
  new TypedReducer<Products, ProductsSuccess>(productsSuccessReducer)
]);

Products productsSuccessReducer(Products products, ProductsSuccess action) {
  return action.products;
}