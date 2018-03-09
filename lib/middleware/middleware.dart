import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';

import 'package:flutter_redux_boilerplate/models/app_state.dart';

final persistor = new Persistor<AppState>(key: 'redux-app', decoder: AppState.rehydrationJSON);

// Set up middlewares
List createMiddleware() => [
    thunkMiddleware,
    persistor.createMiddleware(),
    new LoggingMiddleware.printer(),
];