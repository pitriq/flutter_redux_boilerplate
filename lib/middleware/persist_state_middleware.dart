import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';

void persistStateMiddleware(Store<AppState> store, action, NextDispatcher next) async {
    if (action is UserLoginSuccess || action is UserLogout ) {
        next(action);
        try {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            final encoded = JSON.encode(store.state.auth.toJSON());
            print('Successfully persisted auth state: $encoded');
            prefs.setString('store/persistor', encoded);
        } catch (e) {
            print('Error persisting auth state: $e');
        }
    } else {
        next(action);
    }
}