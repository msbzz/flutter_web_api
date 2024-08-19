import 'dart:async';

Future<T> delayedFetch<T>(int seconds, Future<T> Function() funcFetch) {
  return Future.delayed(Duration(seconds: seconds)).then((_) => funcFetch());
}
 