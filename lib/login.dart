import 'package:flutter/material.dart';
import 'package:wordpress_flutter/data/rest_ds.dart';
import 'package:wordpress_flutter/models/user_model.dart';
import 'package:wordpress_flutter/utils/auth.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> implements AuthStateListener {
  BuildContext _ctx;
  bool _isLoading = false;

  RestDatasource api = new RestDatasource();
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPageState() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _doLogin() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      api.login(_username, _password).then(
        (UserModel user) {
          onLoginSuccess(user);
        },
      ).catchError((error) {
        onLoginError(error.message.toString().substring(10));
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  void onLoginSuccess(UserModel user) {
    _showSnackBar(user.user_display_name + " login succeed");
    setState(() => _isLoading = false);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);
  }

  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN)
      Navigator.of(_ctx).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = RaisedButton(
      onPressed: _doLogin,
      color: new Color.fromRGBO(245, 58, 51, 1.0),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 80.0,
      ),
      elevation: 40.0,
      child: new Text(
        'Log In',
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/cafe.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(
              top: 75.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Welcome\nWordpress\nCafe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Wordpress cafe 멤버가 되시면 다양한\n혜택을 받으실 수 있습니다.',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 252, 252, 1.0),
                    fontSize: 13.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 35.0,
                    right: 35.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          onSaved: (val) => _username = val,
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'Email address',
                            hintStyle: new TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1.0),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          onSaved: (val) => _password = val,
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: new TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1.0),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        _isLoading ? new CircularProgressIndicator() : loginBtn
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.only(
                //     left: 145.0,
                //   ),
                //   child: Text(
                //     'Forgot your password?\n',
                //     style: TextStyle(
                //       color: Color.fromRGBO(255, 255, 255, 1.0),
                //       fontSize: 12.0,
                //     ),
                //   ),
                // ),

                // Container(
                //   padding: const EdgeInsets.only(
                //     left: 35.0,
                //   ),
                //   child: Text(
                //     'Don\'t have an account?\n',
                //     style: TextStyle(
                //       color: Color.fromRGBO(255, 255, 255, 1.0),
                //       fontSize: 12.0,
                //     ),
                //   ),
                // ),
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    color: new Color.fromRGBO(245, 58, 51, 0.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 0.0,
                    ),
                    // elevation: 40.0,
                    child: new Text(
                      '아니요! 로그인없이 시작할래요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
