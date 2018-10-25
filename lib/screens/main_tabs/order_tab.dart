import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/order.dart';
import 'package:flutter_redux_boilerplate/models/product.dart';
import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:redux/redux.dart';

class OrderTab  extends StatelessWidget {
    OrderTab({Key key}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
      return new StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) {
        _ViewModel vm = _ViewModel.fromStore(store);
        return vm;
      }, builder: (BuildContext context, vm) {
        return new Center(
        child: new MyCustomForm()
      );
      });
    }
}

class _ViewModel {
    final AuthState auth;
    final Order order;

    _ViewModel({
      @required this.auth,
      @required this.order,
    });

    static _ViewModel fromStore(Store<AppState> store) {
      return new _ViewModel(auth: store.state.auth, order: store.state.order);
    }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(
              hintText: 'frites, steak, etc.',
              labelText: 'Liste des produits'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Container(
              child: new RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, we want to show a Snackbar
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Traitement en cours...')));
                  }
                },
                child: Text('Commander'),
              ),
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 5.0),

            ),
          ),
        ],
      ),
    );
  }
}