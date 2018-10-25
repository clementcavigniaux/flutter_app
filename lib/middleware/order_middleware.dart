import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';
import 'package:flutter_redux_boilerplate/models/user.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createOrderMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, OrderRequest>(getOrder),
    ];

final getOrder = _getOrder();

Middleware<AppState> _getOrder() {
  return (Store store, action, NextDispatcher next) async {
    if (action is OrderRequest) {
      List<Product> listProduct = [];
      listProduct.add(
        new Product(
          "0",
          "pc",
          new Category(
            "0",
            "entrée"
          ),
          5.00
        )
      );
      listProduct.add(
        new Product(
          "1",
          "souris",
          new Category(
            "1",
            "plat"
          ),
          10.00
        )
      );
      
      store.dispatch(new OrderSuccess(
        new Order(
          "0",
          listProduct,
          15.00,
          new User("dkhsghjksdfld", "0", "Baptiste", "Decherf")
        )
      ));
    }

    next(action);
  };
}
