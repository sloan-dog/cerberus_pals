import 'package:cerberus_palsy/redux/store.dart' as reduxy;
import 'package:cerberus_palsy/widgets/activity_feed/activity_feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyHomePage(
    title: 'Stephen is drunk',
    store: reduxy.provideStore(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Store<reduxy.AppState> store;
  final String title;

  MyHomePage({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<reduxy.AppState>(
        store: store,
        child: MaterialApp(
            theme: ThemeData.dark(),
            title: title,
            home: Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        '!!!You have pushed the button this many times:',
                      ),
                      StoreConnector<reduxy.AppState, dynamic>(
                          converter: (store) => store.state.counter.toString(),
                          builder: (context, count) {
                            return Text(
                              count,
                              style: Theme.of(context).textTheme.headline4,
                            );
                          })
                    ])),
                Center(
                    child: StoreConnector<reduxy.AppState, dynamic>(
                        converter: (store) => store.state.activities,
                        builder: (context, activities) {
                          return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ActivityFeed(
                                activities: activities,
                              ));
                        })),
                Center(
                    child: StoreConnector<reduxy.AppState, dynamic>(
                        converter: (store) {
                  return () => store.dispatch(new reduxy.AddActivityAction(
                          data: new reduxy.ActivityData(
                        text: 'Fuck you',
                        name:
                            'Billy Jenkinsoisdjsfgoisgfoisgdfjoisfgdijosfgoijsdf',
                        date: new DateTime.now(),
                      )));
                }, builder: (context, callback) {
                  return FloatingActionButton(
                      onPressed: callback,
                      tooltip: 'I hate this',
                      child: Text('Add an activity'));
                })),
              ])),
              floatingActionButton: StoreConnector<reduxy.AppState, dynamic>(
                converter: (store) {
                  // Return a `VoidCallback`, which is a fancy name for a function
                  // with no parameters. It only dispatches an Increment action.
                  return () => store.dispatch(reduxy.CounterActions.increment);
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    // Attach the `callback` to the `onPressed` attribute
                    onPressed: callback,
                    tooltip: 'asdasdasd',
                    child: Icon(Icons.add),
                  );
                },
              ),
            )));
  }
}
