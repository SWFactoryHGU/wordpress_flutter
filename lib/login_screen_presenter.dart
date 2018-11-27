
// import 'package:wordpress_flutter/data/rest_db.dart';
// import 'package:wordpress_flutter/models/user_model.dart';

// abstract class LoginScreenContract {
//   void onLoginSuccess(UserModel user);
//   void onLoginError(String errorTxt);
// }

// class LoginScreenPresenter {
//   LoginScreenContract _view;
//   RestDatasource api = new RestDatasource();
//   LoginScreenPresenter(this._view);

//   doLogin(String username, String password) {
//     api.login(username, password).then((UserModel user) {
//       _view.onLoginSuccess(user);
//     }).catchError((Exception error) => _view.onLoginError(error.toString()));
//   }
// }