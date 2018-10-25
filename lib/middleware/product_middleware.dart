import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createProductMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, ProductRequest>(getProduct),
    ];

final getProduct = _getProduct();

Middleware<AppState> _getProduct() {
  return (Store store, action, NextDispatcher next) async {
    if (action is ProductRequest) {
      store.dispatch(new ProductSuccess(
        new Product(
          "0",
          "pc",
          new Category(
            "0",
            "entrée"
          ),
          5.00
        )
      ));
    }

    next(action);
  };
}
