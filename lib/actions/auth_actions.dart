import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/models/user.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';

class UserLoginRequest {}

class UserLoginSuccess {
    final User user;

    UserLoginSuccess(this.user);
}

class UserLoginFailure {
    final String error;

    UserLoginFailure(this.error);
}

class UserLogout {}

final login = (BuildContext context, String username, String password) {
    return (Store<AppState> store) async {
        store.dispatch(new UserLoginRequest());
        if (username == 'asd' && password == 'asd') {
            store.dispatch(new UserLoginSuccess(new User('placeholder_token', 'placeholder_id')));
            Navigator.of(context).pushReplacementNamed('/main');
        } else {
            store.dispatch(new UserLoginFailure('Username or password were incorrect.'));
        }
    };
};
