import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:flutter_redux_boilerplate/middleware/persist_state_middleware.dart';

// Set up middlewares
List createMiddleware() => [
    thunkMiddleware,
    new LoggingMiddleware.printer(),
    persistStateMiddleware
];