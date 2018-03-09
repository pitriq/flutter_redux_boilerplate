import 'package:redux_persist/redux_persist.dart';

import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action){
    if (action is LoadAction<AppState>) {
        return action.state != null ?
        new AppState().copyWith(rehydrated: true, auth: action.state.auth)
        : new AppState(rehydrated: true);
    } else {
        return new AppState(
            auth: authReducer(state.auth, action),
        );
    }
} 