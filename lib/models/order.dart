import 'package:meta/meta.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/user.dart';

@immutable
class Order {

    final String id;
    final List<Product> products;
    final double price;
    final User user;

    Order(
        this.id,
        this.products,
        this.price,
        this.user
    );

    @override
    String toString() {
        return '''{
                id: $id,
                products: $products,
                price: $price,
                user: $user
            }''';
    }
}