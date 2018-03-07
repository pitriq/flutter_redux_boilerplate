import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';

final rehydrateState = (Store<AppState> store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Rehydrating auth state..');
    try {
        final decoded = JSON.decode(prefs.getString('store/persistor'));
        AuthState auth = new AuthState.fromJSON(decoded);
        print('rehydrating $auth');
        store.dispatch(new RehydrateState(auth));
    }
    catch (e) {
        print('Error rehydrating auth state: $e');
    }
};

class RehydrateState {
    final AuthState auth;

    RehydrateState(this.auth);
}