import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createCategoryMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, CategoryRequest>(getCategory),
    ];

final getCategory = _getCategory();

Middleware<AppState> _getCategory() {
  return (Store store, action, NextDispatcher next) async {
    if (action is CategoryRequest) {
      store.dispatch(new CategorySuccess(
        new Category(
          "0",
          "Entrée"
        )
      ));
    }

    next(action);
  };
}
