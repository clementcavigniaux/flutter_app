import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';
import 'package:flutter_redux_boilerplate/models/orders.dart';
import 'package:flutter_redux_boilerplate/models/user.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createOrdersMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, OrdersRequest>(getOrders),
    ];

final getOrders = _getOrders();

Middleware<AppState> _getOrders() {
  return (Store store, action, NextDispatcher next) async {
    if (action is OrdersRequest) {
      List<Order> listOrder       = [];
      List<Product> listProductA  = [];
      List<Product> listProductB  = [];

      listProductA.add(
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
      listProductA.add(
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
      Order orderA = new Order(
        "0",
        listProductA,
        5.00,
        new User("dkhsghjksdfld", "0", "Baptiste", "Decherf")
      );
      listOrder.add(orderA);
      
      listProductB.add(
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
      Order orderB = new Order(
        "1",
        listProductB,
        2.00,
        new User("dkhsghjksdfld", "0", "Baptiste", "Decherf")
      );
      listOrder.add(orderB);
      
      store.dispatch(new OrdersSuccess(
        new Orders(listOrder)
      ));
    }

    next(action);
  };
}
