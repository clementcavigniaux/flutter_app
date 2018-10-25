import 'package:meta/meta.dart';

import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/products.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';
import 'package:flutter_redux_boilerplate/models/orders.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';
import 'package:flutter_redux_boilerplate/models/categories.dart';

@immutable
class AppState {
    final AuthState auth;
    final Product product;
    final Order order;
    final Orders orders;
    final Category category;
    final Categories categories;
    final Products products;

    AppState({AuthState auth, Product product, Order order, Category category, Products products, Categories categories, Orders orders}):
        auth  = auth ?? new AuthState(),
        product     = product,
        order       = order,
        category    = category,
        products    = products,
        categories  = categories,
        orders      = orders;

    static AppState rehydrationJSON(dynamic json) => new AppState(
        auth: new AuthState.fromJSON(json['auth'])
    );

    Map<String, dynamic> toJson() => {
        'auth': auth.toJSON()
    };

    AppState copyWith({
        bool rehydrated,
        AuthState auth,
        Product product,
        Order order,
        Category category,
        Categories categories,
        Products products,
        Orders orders,
    }) {
        return new AppState(
            auth: auth ?? this.auth,
            product: product ?? this.product,
            order: order ?? this.order,
            category: category ?? this.category,
            categories: categories ?? this.categories,
            products: products ?? this.products,
            orders: orders ?? this.orders,
        );
    }

    @override
    String toString() {
        return '''AppState{
            auth: $auth,
            product: $product,
            order: $order,
            category: $category,
            categories: $categories,
            products: $products,
            orders: $orders,
        }''';
    }
}