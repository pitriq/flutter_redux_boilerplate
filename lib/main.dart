import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_boilerplate/presentation/platform_adaptive.dart';
import 'package:flutter_redux_boilerplate/screens/loading_screen.dart';
import 'package:flutter_redux_boilerplate/screens/login_screen.dart';
import 'package:flutter_redux_boilerplate/screens/main_screen.dart';
import 'package:flutter_redux_boilerplate/store/store.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/actions/persist_actions.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget {
    final store = createStore();

    ReduxApp();

    @override
    Widget build(BuildContext context) {
        return new StoreProvider(
            store: store,
            child: new MaterialApp(
                title: 'ReduxApp',
                theme: defaultTargetPlatform == TargetPlatform.iOS
                    ? kIOSTheme
                    : kDefaultTheme,
            routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => new StoreBuilder<AppState>(
                        onInit: (store) {
                            //store.dispatch(rehydrateState);
                        },
                        /* 
                        TODO: create a middleware to navigate on
                        LoginSuccess, Logout y RehydrateState       
                        */
                        builder: (BuildContext context, store) => new LoadingScreen(),
                ),
                '/login': (BuildContext context) => new LoginScreen(),
                '/main': (BuildContext context) => new MainScreen()
            }
            )
        );
    }

}