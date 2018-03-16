# flutter_redux_boilerplate

A Flutter application boilerplate, with Redux included.

## Motivation

Coming from a React Native background, using Redux in dart feels rather awkward. This project's purpose is to provide a well-structured starter project, with an architeture that resembles Redux.js'.

This boilerplate includes:

* [redux.dart](https://pub.dartlang.org/packages/redux)
* [flutter_redux.dart](https://pub.dartlang.org/packages/flutter_redux)
* [redux_thunk.dart](https://pub.dartlang.org/packages/redux_thunk)
* [redux_logging.dart](https://pub.dartlang.org/packages/redux_logging)
* [redux_persist.dart](https://pub.dartlang.org/packages/redux_persist) & [redux_persist_flutter.dart](https://pub.dartlang.org/packages/redux_persist_flutter) to preserve the auth state between app executions
* Bottom navigation
* Drawer

## Structure

This project is split into a few directories:

**Store** directory has only one file (`store.dart`), which is used to initialize the Store. It makes use of some middlewares, which are imported from **midddleware** directory. There, you will find `middleware.dart`. That file's purpose is to return an array of middlewares, as well as initializing a persistor (read [redux_persist.dart](https://pub.dartlang.org/packages/redux_persist) docs for more info).

**Models** directory holds objects used across the app, such as State objects. 
`app_state.dart` defines the Store's main State, which has other State objects (like `auth_state.dart`) as its properties. This way, you will be able to access to State just like you would in Redux.js. 

```dart
AppState{
    auth: AuthState {
        // AuthState props...   
    },
}
```

(you can then read that in your app with store.state.auth.{prop})

**Reducers** are built with [redux.dart](https://pub.dartlang.org/packages/redux)'s helper functions. You can read about that [here](https://github.com/johnpryan/redux.dart/blob/master/doc/combine_reducers.md).

**Screens**, **containers** and **presentation** directories just hold widgets. They're separated for clarity matters. 

**Containers** are widgets which access to State data via [flutter_redux.dart](https://pub.dartlang.org/packages/flutter_redux) connector widgets. 
**Presentation** widgets just receive and show props (usually coming from container widgets). 
**Screens** are presentation widgets too, with the difference they hold other widgets to form screens. They're rendered in `main.dart` routes.

**Styles** directory holds some Maps used to style the app consistently.

`main.dart` is the application's entry point. There you set up your StoreProvider and your routes.

## Inspiration

This has been inspired by this delightful projects:

* [flutter_architecture_samples](https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux) by brianegan
* [memechat](https://github.com/efortuna/memechat/tree/master) by the boys at Google
* [flutterstarter](https://github.com/felipecarvalho/flutterstarter) by felipecarvalho
