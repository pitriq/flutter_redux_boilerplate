import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:flutter_redux_boilerplate/models/app_state.dart';

final persistor = new Persistor<AppState>(storage: new FlutterStorage('redux-app'), decoder: AppState.rehydrationJSON);

// Set up middlewares
List createMiddleware() => [
    thunkMiddleware,
    persistor.createMiddleware(),
    new LoggingMiddleware.printer(),
];