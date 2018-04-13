import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:flutter_redux_boilerplate/presentation/platform_adaptive.dart';
import 'package:flutter_redux_boilerplate/screens/loading_screen.dart';
import 'package:flutter_redux_boilerplate/screens/login_screen.dart';
import 'package:flutter_redux_boilerplate/screens/main_screen.dart';
import 'package:flutter_redux_boilerplate/store/store.dart';
import 'package:flutter_redux_boilerplate/middleware/middleware.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget {
    final store = createStore();

    ReduxApp();

    @override
    Widget build(BuildContext context) {
        return new PersistorGate(
            persistor: persistor,
            loading: new LoadingScreen(),
            builder: (context) => new StoreProvider<AppState>(
                store: store,
                child: new MaterialApp(
                    title: 'ReduxApp',
                    theme: defaultTargetPlatform == TargetPlatform.iOS
                        ? kIOSTheme
                        : kDefaultTheme,
                routes: <String, WidgetBuilder>{
                    '/': (BuildContext context) => new StoreConnector<AppState, dynamic>( 
                        converter: (store) => store.state.auth.isAuthenticated, 
                        builder: (BuildContext context, isAuthenticated) => isAuthenticated ? new MainScreen() : new LoginScreen()
                    ),
                    '/login': (BuildContext context) => new LoginScreen(),
                    '/main': (BuildContext context) => new MainScreen()
                }
                )
            ),
        );
    }

}