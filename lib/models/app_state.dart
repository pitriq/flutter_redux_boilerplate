import 'package:meta/meta.dart';

import 'package:flutter_redux_boilerplate/models/auth_state.dart';

@immutable
class AppState {
    final bool rehydrated;
    final AuthState auth;

    AppState({AuthState auth, this.rehydrated = false}):
        auth = auth ?? new AuthState();

    static AppState rehydrationJSON(dynamic json) {
        //if (json)
        return new AppState(
            auth: new AuthState.fromJSON(json['auth'])
        );
    }

    Map<String, dynamic> toJson() => {
        'auth': auth.toJSON()
    };

    AppState copyWith({
        bool rehydrated,
        AuthState auth,
    }) {
        return new AppState(
            rehydrated: rehydrated ?? this.rehydrated,
            auth: auth ?? this.auth
        );
    }

    @override
    String toString() {
        return '''AppState{
            rehydrated: $rehydrated,
            auth: $auth,
        }''';
    }
}