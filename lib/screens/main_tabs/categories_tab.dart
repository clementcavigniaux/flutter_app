import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/categories.dart';
import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:redux/redux.dart';

class CategoriesTab  extends StatelessWidget {
    CategoriesTab({Key key}) : super(key: key);

    List<Widget> getTextWidgets(_ViewModel vm, BuildContext context)
    {
      List<Row> list = new List<Row>();
        list.add(new Row(
          children: [
            new RaisedButton(
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(new CategoriesRequest());
              },
              child: Text("Ajouter une catégorie")
            ),
          ]
        ));
        if (vm.categories != null) {
          for(var i = 0; i < vm.categories.categories.length; i++){
            list.add(new Row(children: [new Text("- " + vm.categories.categories[i].name)]));
          }
        } else {
          list.add(new Row(children: [new Text('Pas de catégorie')]));
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
    final Categories categories;

    _ViewModel({
      @required this.auth,
      @required this.categories,
    });

    static _ViewModel fromStore(Store<AppState> store) {
      return new _ViewModel(auth: store.state.auth, categories: store.state.categories);
    }
}