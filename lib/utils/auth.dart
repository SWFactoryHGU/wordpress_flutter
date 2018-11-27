import 'package:wordpress_flutter/models/user_model.dart';

enum AuthState { LOGGED_IN, LOGGED_OUT }

abstract class AuthStateListener {
  UserModel user;
  void onAuthStateChanged(AuthState state);
}

// A naive implementation of Observer/Subscriber Pattern. Will do for now.
class AuthStateProvider {
  static final AuthStateProvider _instance = new AuthStateProvider.internal();

  List<AuthStateListener> _subscribers;

  factory AuthStateProvider() => _instance;
  AuthStateProvider.internal() {
    _subscribers = new List<AuthStateListener>();
    initState();
  }

  void initState() async {
    notify(AuthState.LOGGED_OUT);
  }

  void subscribe(AuthStateListener listener) {
    _subscribers.add(listener);
  }

  void dispose(AuthStateListener listener) {
    for (var l in _subscribers) {
      if (l == listener) _subscribers.remove(l);
    }
  }

  void notify(AuthState state) {
    _subscribers.forEach((AuthStateListener s) {
      s.onAuthStateChanged(state);
    });
  }

  // void insertDetails(UserModel response) {
  //   _subscribers.forEach((AuthStateListener s) {
  //     s.user = response;
  //   });
  // }

  AuthStateListener getListener() {
    AuthStateListener listener;
    _subscribers.forEach((AuthStateListener s) {
      listener = s;
    });
    return listener;
    // return null;
  }
}
