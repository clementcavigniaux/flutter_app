import 'package:meta/meta.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';

@immutable
class Orders {

    final List<Order> orders;

    Orders(
        this.orders
    );

    @override
    String toString() {
        return '''{
                orders: $orders
            }''';
    }
}