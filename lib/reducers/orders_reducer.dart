import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/orders.dart';
import 'package:redux/redux.dart';

Reducer<Orders> ordersReducer = combineReducers([
  new TypedReducer<Orders, OrdersSuccess>(ordersSuccessReducer)
]);

Orders ordersSuccessReducer(Orders orders, OrdersSuccess action) {
  return action.orders;
}