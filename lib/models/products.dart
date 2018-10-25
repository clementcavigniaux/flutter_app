import 'package:meta/meta.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';

@immutable
class Products {

    final List<Product> products;

    Products(
        this.products
    );

    @override
    String toString() {
        return '''{
                products: $products
            }''';
    }
}