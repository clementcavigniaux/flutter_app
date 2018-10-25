import 'package:meta/meta.dart';

@immutable
class Category {

    final String id;
    final String name;

    Category(
        this.id,
        this.name
    );

    @override
    String toString() {
        return '''{
                id: $id,
                name: $name
            }''';
    }
}