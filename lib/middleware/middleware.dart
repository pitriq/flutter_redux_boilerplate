import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

// Set up middlewares
List createMiddleware() => [
    new LoggingMiddleware.printer(),
    thunkMiddleware
];