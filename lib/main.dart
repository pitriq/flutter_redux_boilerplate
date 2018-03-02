import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_boilerplate/platform_adaptive.dart';
import 'package:flutter_redux_boilerplate/store/store.dart';

import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:redux/redux.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget {

    ReduxApp();

    @override
    Widget build(BuildContext context) {
        return new StoreProvider(
            store: createStore(),
            child: new MaterialApp(
                title: 'ReduxApp',
                theme: defaultTargetPlatform == TargetPlatform.iOS
                    ? kIOSTheme
                    : kDefaultTheme,
                home: new Scaffold(
                        appBar: new PlatformAdaptiveAppBar(
                        title: new Text('ReduxApp'),
                        platform: Theme.of(context).platform,
                    ),
                    body: new Center(
                        child: (
                            new StoreConnector<AppState, Function>(
                                converter: (Store<AppState> store) {
                                    return () => store.dispatch(new UserLoginRequest());
                                },
                                builder: (BuildContext context, Function onPress) {
                                    return new PlatformAdaptiveButton(icon: new Icon(Icons.add), onPressed: onPress);
                                }
                            )
                        )
                    )
                )
            )
        );
    }

}

/**
 * ROAD TO GLORY
 * TODO: probar thunks
 * TODO: generar una tabscreen y encontrar la forma optima de integrarla con redux
 * TODO: hacer funcar fluro
 * TODO: persistir authReducer en localStorage (estaria bueno implementar redux persist en dart tho)
 */