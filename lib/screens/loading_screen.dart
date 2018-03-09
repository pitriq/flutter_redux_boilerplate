import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/scheduler.dart';
import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/styles/colors.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';

class LoadingScreen extends StatelessWidget {
    
    LoadingScreen({Key key}): super(key: key);

    @override
    Widget build(BuildContext context) {
        print('built');
        return new StoreConnector(
            converter: _ViewModel.fromStore,
            builder: (BuildContext context, vm) {
                if (vm.rehydrated) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                        vm.isAuthenticated ? Navigator.of(context).pushReplacementNamed('/main')
                        : Navigator.of(context).pushReplacementNamed('/login');
                    });
                }
                return new Scaffold(
                    body: new Center(
                        child: new CircularProgressIndicator(
                            backgroundColor: colorStyles['primary'],
                            strokeWidth: 2.0
                        ),
                    ),
                );
            },
        );
    }

}

class _ViewModel {
    final bool rehydrated;
    final bool isAuthenticated;

    _ViewModel({
        this.rehydrated,
        this.isAuthenticated,
    });

    static _ViewModel fromStore(Store<AppState> store) {
        return new _ViewModel(
            rehydrated: store.state.rehydrated,
            isAuthenticated: store.state.auth.isAuthenticated,
        );
    }
}