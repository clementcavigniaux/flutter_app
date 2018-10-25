import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:flutter_redux_boilerplate/models/categories.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createCategoriesMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, CategoriesRequest>(getCategories),
    ];

final getCategories = _getCategories();

Middleware<AppState> _getCategories() {
  return (Store store, action, NextDispatcher next) async {
    if (action is CategoriesRequest) {
      List<Category> lc = new List<Category>();
      lc.add(
        new Category(
          "0",
          "entrée"
        )
      );
      lc.add(
        new Category(
          "1",
          "plat"
        )
      );
      store.dispatch(new CategoriesSuccess(new Categories(lc)));
    }

    next(action);
  };
}
