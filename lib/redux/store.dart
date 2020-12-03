import 'dart:html';

import 'package:redux/redux.dart';

enum Actions {
  increment,
  decrement,
}

int counterReducer(int state, action){
  if (action == Actions.increment) {
    return state + 1;
  } else if (action == Actions.decrement) {
    return state - 1;
  }
  return state;
}

loggingMiddleware(Store<int> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}

provideStore() {
  final store = new Store<int>(
    counterReducer,
    initialState: 0,
    middleware: [loggingMiddleware],
  );

  return store;
}