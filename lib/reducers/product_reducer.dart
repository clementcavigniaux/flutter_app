import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:redux/redux.dart';

Reducer<Product> productReducer = combineReducers([
  new TypedReducer<Product, ProductSuccess>(productSuccessReducer)
]);

Product productSuccessReducer(Product product, ProductSuccess action) {
  return action.product;
}