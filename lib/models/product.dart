import 'package:meta/meta.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';

@immutable
class Product {

    final String id;
    final String name;
    final Category category;
    final double price;

    Product(
        this.id,
        this.name,
        this.category,
        this.price
    );

    @override
    String toString() {
        return '''{
                id: $id,
                name: $name,
                category: $category,
                price: $price
            }''';
    }
}