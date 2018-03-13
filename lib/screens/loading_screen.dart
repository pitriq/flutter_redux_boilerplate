import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_redux_boilerplate/styles/colors.dart';

class LoadingScreen extends StatelessWidget {
    
    LoadingScreen({Key key}): super(key: key);

    @override
    Widget build(BuildContext context) {
        return new StoreConnector(
            converter: (store) => store.state.auth.isAuthenticated,
            builder: (BuildContext context, isAuthenticated) {
                
                SchedulerBinding.instance.addPostFrameCallback((_) {
                    isAuthenticated ? Navigator.of(context).pushReplacementNamed('/main')
                    : Navigator.of(context).pushReplacementNamed('/login');
                });

                return new Scaffold(
                    body: new Center(
                        child: new CircularProgressIndicator(
                            backgroundColor: colorStyles['gray'],
                            strokeWidth: 2.0
                        ),
                    ),
                );
            },
        );        
    }

}