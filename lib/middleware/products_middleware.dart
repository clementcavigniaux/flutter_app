import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/products.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createProductsMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, ProductsRequest>(getProducts),
    ];

final getProducts = _getProducts();

Middleware<AppState> _getProducts() {
  return (Store store, action, NextDispatcher next) async {
    if (action is ProductsRequest) {
      List<Product> lp = new List<Product>();
      lp.add(
        new Product(
          "0",
          "frites",
          new Category(
            "1",
            "plat"
          ),
          2.00
        )
      );
      lp.add(
        new Product(
          "1",
          "steak",
          new Category(
            "1",
            "plat"
          ),
          3.00
        )
      );

      store.dispatch(new ProductsSuccess(new Products(lp)));
    }

    next(action);
  };
}
