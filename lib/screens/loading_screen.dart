import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/styles/colors.dart';

class LoadingScreen extends StatelessWidget {
    
    LoadingScreen({Key key}): super(key: key);

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: new Column (children: <Widget>[
                new Center(
                    child: new CircularProgressIndicator(backgroundColor: colorStyles['primary'],),
                ),    
            ])
        );
    }

}