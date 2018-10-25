import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/categories.dart';
import 'package:redux/redux.dart';

Reducer<Categories> categoriesReducer = combineReducers([
  new TypedReducer<Categories, CategoriesSuccess>(categoriesSuccessReducer)
]);

Categories categoriesSuccessReducer(Categories categories, CategoriesSuccess action) {
  return action.categories;
}