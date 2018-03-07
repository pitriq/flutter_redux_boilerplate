import 'package:meta/meta.dart';

import 'package:flutter_redux_boilerplate/models/auth_state.dart';

@immutable
class AppState {
    final AuthState auth;

    AppState({AuthState auth}):
        auth = auth ?? new AuthState();

    @override
    String toString() {
        return '''AppState{
            auth: $auth,
        }''';
    }
}