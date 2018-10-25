import 'package:meta/meta.dart';
import 'package:flutter_redux_boilerplate/models/category.dart';

@immutable
class Categories {

    final List<Category> categories;

    Categories(
        this.categories
    );

    @override
    String toString() {
        return '''{
                categories: $categories
            }''';
    }
}