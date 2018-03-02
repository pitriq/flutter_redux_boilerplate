import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action) => new AppState(
    authReducer(state.auth, action)
);