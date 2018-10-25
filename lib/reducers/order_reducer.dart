import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';
import 'package:redux/redux.dart';

Reducer<Order> orderReducer = combineReducers([
  new TypedReducer<Order, OrderSuccess>(orderSuccessReducer)
]);

Order orderSuccessReducer(Order order, OrderSuccess action) {
  return action.order;
}