import 'package:meta/meta.dart';

@immutable
class AuthState {

    // properties
    final bool isAuthenticated;
    final bool isAuthenticating;

    // constructor with default
    AuthState({
        this.isAuthenticated = false,
        this.isAuthenticating = false
    });

    // allows to modify AuthState parameters while returning a copy of the unchanged parameters
    AuthState copyWith({
        bool isAuthenticated,
        bool isAuthenticating,
    }) {
        return new AuthState(
            isAuthenticated: isAuthenticated ?? this.isAuthenticated,
            isAuthenticating: isAuthenticating ?? this.isAuthenticating
        );
    }

    @override
    String toString() {
        return '{isAuthenticated: $isAuthenticated, isAuthenticating: $isAuthenticating}';
    }
}