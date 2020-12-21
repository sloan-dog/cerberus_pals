import 'package:redux/redux.dart';

enum CounterActions {
  increment,
  decrement,
}

int counterReducer(int counterState, action) {
  if (action == CounterActions.increment) {
    return counterState + 1;
  } else if (action == CounterActions.decrement) {
    return counterState - 1;
  }
  return counterState;
}

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}

provideStore() {
  final store = new Store<AppState>(
    appStateReducer,
    initialState: new AppState([], 0),
    middleware: [loggingMiddleware],
  );

  return store;
}

class AddActivityAction {
  ActivityData data;

  AddActivityAction({this.data});
}

List<ActivityData> activityReducer(List<ActivityData> activities, action) {
  if (action is AddActivityAction) {
    return List.from(activities)..add(action.data);
  } else {
    return activities;
  }
}

AppState appStateReducer(AppState state, action) => new AppState(
      activityReducer(state.activities, action),
      counterReducer(state.counter, action),
    );

class ActivityData {
  final String text;
  final DateTime date;
  final String name;
  ActivityData({this.text, this.date, this.name});
}

class AppState {
  List<ActivityData> activities;
  int counter;
  AppState(this.activities, this.counter);
}
