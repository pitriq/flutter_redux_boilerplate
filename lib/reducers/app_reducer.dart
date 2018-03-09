import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/auth_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/persist_reducer.dart';

AppState appReducer(AppState state, action) => new AppState(
    rehydrated: persistReducer(state.rehydrated, action),
    auth: authReducer(state.auth, action),
);