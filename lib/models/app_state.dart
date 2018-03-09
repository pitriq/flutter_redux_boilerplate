import 'package:meta/meta.dart';

import 'package:flutter_redux_boilerplate/models/auth_state.dart';

@immutable
class AppState {
    final bool rehydrated;
    final AuthState auth;

    AppState({AuthState auth, this.rehydrated = false}):
        auth = auth ?? new AuthState();

    @override
    String toString() {
        return '''AppState{
            rehydrated: $rehydrated,
            auth: $auth,
        }''';
    }
}