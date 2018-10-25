import 'package:redux_persist/redux_persist.dart';

import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/auth_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/product_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/products_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/order_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/orders_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/category_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/categories_reducer.dart';

AppState appReducer(AppState state, action){
    //print(action);
    if (action is PersistLoadedAction<AppState>) {
        return action.state ?? state;
    } else {
        return new AppState(
            auth: authReducer(state.auth, action),
            product: productReducer(state.product, action),
            category: categoryReducer(state.category, action),
            order: orderReducer(state.order, action),
            orders: ordersReducer(state.orders, action),
            products: productsReducer(state.products, action),
            categories: categoriesReducer(state.categories, action)
        );
    }
} 