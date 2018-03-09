import 'package:redux/redux.dart';

import 'package:flutter_redux_boilerplate/actions/persist_actions.dart';

Reducer<bool> persistReducer = combineTypedReducers([
    new ReducerBinding<bool, StateRehydrated>(stateRehydratedReducer),
]);

bool stateRehydratedReducer(bool rehydrated, StateRehydrated action) {
    return true;
} 
