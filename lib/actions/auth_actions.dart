import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/user.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/products.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:flutter_redux_boilerplate/models/categories.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';
import 'package:flutter_redux_boilerplate/models/orders.dart';
import 'package:redux/redux.dart';

class OrdersRequest {
  OrdersRequest();
}

class OrdersSuccess {
  final Orders orders;

  OrdersSuccess(this.orders);
}

class OrdersFailure {
  final String error;

  OrdersFailure(this.error);
}

class CategoriesRequest {
  CategoriesRequest();
}

class CategoriesSuccess {
  final Categories categories;

  CategoriesSuccess(this.categories);
}

class CategoriesFailure {
  final String error;

  CategoriesFailure(this.error);
}

class ProductsRequest {
  ProductsRequest();
}

class ProductsSuccess {
  final Products products;

  ProductsSuccess(this.products);
}

class ProductsFailure {
  final String error;

  ProductsFailure(this.error);
}

class OrderRequest {
  OrderRequest();
}

class OrderSuccess {
  final Order order;

  OrderSuccess(this.order);
}

class OrderFailure {
  final String error;

  OrderFailure(this.error);
}

class CategoryRequest {
  CategoryRequest();
}

class CategorySuccess {
  final Category category;

  CategorySuccess(this.category);
}

class CategoryFailure {
  final String error;

  CategoryFailure(this.error);
}

class ProductRequest {
  ProductRequest();
}

class ProductSuccess {
  final Product product;

  ProductSuccess(this.product);
}

class ProductFailure {
  final String error;

  ProductFailure(this.error);
}

class UserLoginRequest {
  final BuildContext context;
  final String username;
  final String password;

  UserLoginRequest(this.context, this.username, this.password);
}

class UserLoginSuccess {
  final User user;

  UserLoginSuccess(this.user);
}

class UserLoginFailure {
  final String error;

  UserLoginFailure(this.error);
}

class UserLogout {}

final Function logout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(new UserLogout());
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
  };
};
