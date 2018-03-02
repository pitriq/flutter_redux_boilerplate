import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/auth_state.dart';

Reducer<AuthState> authReducer = combineTypedReducers([
    new ReducerBinding<AuthState, UserLoginRequest>(userLoginRequestReducer),
    new ReducerBinding<AuthState, UserLoginSuccess>(userLoginSuccessReducer),
    new ReducerBinding<AuthState, UserLoginFailure>(userLoginFailureReducer),
]);

AuthState userLoginRequestReducer(AuthState auth, UserLoginRequest action) {
    return new AuthState().copyWith(
        isAuthenticated: false,
        isAuthenticating: true,
    );
}

AuthState userLoginSuccessReducer(AuthState auth, UserLoginSuccess action) {
    return new AuthState().copyWith(
        isAuthenticated: true,
        isAuthenticating: false,
    );
}

AuthState userLoginFailureReducer(AuthState auth, UserLoginFailure action) {
    return new AuthState().copyWith(
        isAuthenticated: false,
        isAuthenticating: false
    );
}