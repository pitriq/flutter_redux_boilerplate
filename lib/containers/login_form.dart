import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/presentation/platform_adaptive.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';

class LoginForm extends StatefulWidget {
    @override
    _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
    final formKey = new GlobalKey<FormState>();

    String _username;
    String _password;

    void _submit() {
        final form = formKey.currentState;

        if (form.validate()) {
            form.save();
        }
    }

    @override
    Widget build(BuildContext context) {
        return new StoreConnector<AppState, dynamic>(
            converter: (Store<AppState> store) {
                return (BuildContext context, String username, String password) => 
                    store.dispatch(login(context, username, password));
            },
            builder: (BuildContext context, loginAction) {
                return new Form(
                    key: formKey,
                    child: new Column(
                        children: [
                            new TextFormField(
                                decoration: new InputDecoration(labelText: 'Username'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter your username.' : null,
                                onSaved: (val) => _username = val,
                            ),
                            new TextFormField(
                                decoration: new InputDecoration(labelText: 'Password'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter your password.' : null,
                                onSaved: (val) => _password = val,
                                obscureText: true,
                            ),
                            new Padding(
                                padding: new EdgeInsets.only(top: 20.0),
                                child: new PlatformAdaptiveButton(
                                    onPressed:() {
                                        _submit();
                                        loginAction(context, _username, _password);
                                    },
                                    icon: new Icon(Icons.done),
                                    child: new Text('Log In'),
                                ),
                            )
                        ],
                    ),
                );
            }
        );
    }

}