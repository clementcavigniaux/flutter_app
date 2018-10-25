import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/products.dart';
import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:redux/redux.dart';

class ProductsTab  extends StatelessWidget {
    ProductsTab({Key key}) : super(key: key);

    List<Widget> getTextWidgets(_ViewModel vm, BuildContext context)
    {
      List<Row> list = new List<Row>();
        list.add(new Row(
          children: [
            new RaisedButton(
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(new ProductsRequest());
              },
              child: Text("Ajouter un produit")
            ),
          ]
        ));
        if (vm.products != null) {
          for(var i = 0; i < vm.products.products.length; i++){
            list.add(new Row(children: [new Text("- " + vm.products.products[i].name + " (" + vm.products.products[i].category.name + ") : " + vm.products.products[i].price.toString() + "€")]));
          }
        } else {
          list.add(new Row(children: [new Text('Pas de produit')]));
        }

      return list;
    }

    @override
    Widget build(BuildContext context) {
      return new StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) {
        _ViewModel vm = _ViewModel.fromStore(store);
        return vm;
      }, builder: (BuildContext context, vm) {
        return new Center(
        child: new Column(
          children: getTextWidgets(vm, context)
        )
      );
      });
    }

}

class _ViewModel {
    final AuthState auth;
    final Products products;

    _ViewModel({
      @required this.auth,
      @required this.products,
    });

    static _ViewModel fromStore(Store<AppState> store) {
      return new _ViewModel(auth: store.state.auth, products: store.state.products);
    }
}