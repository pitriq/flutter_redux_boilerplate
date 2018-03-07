import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/containers/login_form.dart';

class LoginScreen extends StatelessWidget {
    LoginScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: new Center(
                child: new LoginForm(),
            )
        );
    }

}