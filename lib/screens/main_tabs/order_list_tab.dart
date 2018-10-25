import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/orders.dart';
import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:redux/redux.dart';

class OrderListTab  extends StatelessWidget {
    OrderListTab({Key key}) : super(key: key);

    List<Widget> getTextWidgets(_ViewModel vm, BuildContext context)
    {
      List<Row> list = new List<Row>();
        list.add(new Row(
          children: [
            new RaisedButton(
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(new OrdersRequest());
              },
              child: Text("Ajouter une commande")
            ),
          ]
        ));
        if (vm.orders != null) {
          for(var i = 0; i < vm.orders.orders.length; i++){
              list.add(new Row(children: [new Text("- " + vm.orders.orders[i].user.firstname + " " + vm.orders.orders[i].user.lastname + " (" + vm.orders.orders[i].price.toString() + "€ )")]));
              list.add(new Row(children: [new Text("Détails de la commande :")]));
            for(var j = 0; j < vm.orders.orders[i].products.length; j++){
              list.add(new Row(children: [new Text("   - " + vm.orders.orders[i].products[j].name + " (" + vm.orders.orders[i].products[j].category.name + ") : " + vm.orders.orders[i].products[j].price.toString() + "€")]));
            }
          }
        } else {
          list.add(new Row(children: [new Text('Pas de commande')]));
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
    final Orders orders;

    _ViewModel({
      @required this.auth,
      @required this.orders,
    });

    static _ViewModel fromStore(Store<AppState> store) {
      return new _ViewModel(auth: store.state.auth, orders: store.state.orders);
    }
}