import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:redux/redux.dart';

Reducer<Category> categoryReducer = combineReducers([
  new TypedReducer<Category, CategorySuccess>(categorySuccessReducer)
]);

Category categorySuccessReducer(Category category, CategorySuccess action) {
  return action.category;
}