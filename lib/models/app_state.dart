import 'package:meta/meta.dart';

import 'package:flutter_redux_boilerplate/models/auth_state.dart';

@immutable
class AppState {

    final AuthState auth;

    AppState(this.auth);

    factory AppState.initial() => new AppState(
        new AuthState()
    );

    @override
    String toString() {
        return 'AppState{AuthState: $auth}';
    }
}