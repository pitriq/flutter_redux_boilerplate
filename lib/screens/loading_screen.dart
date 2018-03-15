import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/styles/colors.dart';

class LoadingScreen extends StatelessWidget {
    
    LoadingScreen({Key key}): super(key: key);

    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: new Scaffold(
                body: new Center(
                    child: new CircularProgressIndicator(
                        backgroundColor: colorStyles['gray'],
                        strokeWidth: 2.0
                    ),
                ),
            ),
        );
    }

}