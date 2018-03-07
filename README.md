# flutter_redux_boilerplate

A Flutter application boilerplate, with Redux included.

## Motivation

Coming from a React Native background, using Redux in dart feels rather awkward. This project's purpose is to provide a well-structured starter project, with an architeture that resembles Redux.js'.

This boilerplate includes:

* [redux.dart](https://pub.dartlang.org/packages/redux)
* [flutter_redux.dart](https://pub.dartlang.org/packages/flutter_redux)
* [redux_thunk.dart](https://pub.dartlang.org/packages/redux_thunk)
* [redux_logging.dart](https://pub.dartlang.org/packages/redux_logging)
* A [redux-persist](https://github.com/rt2zz/redux-persist)-like implementation using [shared_preferences](https://pub.dartlang.org/packages/shared_preferences) to preserve the auth state between app executions

## Inspiration

This project has been inspired by this delightful projects:

* [flutter_architecture_samples](https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux) by brianegan
* [memechat](https://github.com/efortuna/memechat/tree/master) by the boys at Google