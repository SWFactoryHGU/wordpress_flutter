import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show post;
import 'package:wordpress_flutter/utils/auth.dart';

class ReviewWritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReviewWritePageState();
  }
}

class ReviewWritePageState extends State<ReviewWritePage> {
  BuildContext _ctx;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  String name;
  String content;

  AuthStateListener s;
  AuthStateProvider authStateProvider;

  @override
  void initState() {
    // TODO: implement initState
    authStateProvider = new AuthStateProvider();
    this.s = authStateProvider.getListener();
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  void postReview() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() => _isLoading = true);

      post('http://wordpresscafe.dothome.co.kr/wp-json/wp/v2/posts', headers: {
        'Authorization': 'Bearer\t' + s.user.token
      }, body: {
        'title': name,
        'content': content,
        'categories': '29',
        'status': 'publish',
      }).then((response) {
        final String res = response.body;
        final int statusCode = response.statusCode;
        final JsonDecoder _decoder = new JsonDecoder();

        dynamic json = _decoder.convert(res);

        if (statusCode < 200 || statusCode >= 400 || json == null)
          throw new Exception(json['message']);

        setState(() => _isLoading = false);
        Navigator.of(_ctx).pushReplacementNamed('/review');
      }).catchError((error) {
        setState(() => _isLoading = false);
        _showSnackBar(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    var submitBnt = new RaisedButton(
      child: const Text('Submit'),
      onPressed: postReview,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 80.0,
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('리뷰작성'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Form(
          key: formKey,
          autovalidate: true,
          child: new Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new TextFormField(
                  onSaved: (String value) => this.name = value,
                  validator: (val) {
                    return val.length < 2
                        ? "Username must have at least 2 chars"
                        : null;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: '이름을 입력해 주세요',
                    labelText: '이름',
                  ),
                ),
                new TextFormField(
                  onSaved: (String value) => this.content = value,
                  validator: (val) {
                    return val.length < 10
                        ? "Content must have at least 10 chars"
                        : null;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.text_fields),
                    hintText: '리뷰내용을 적어주세요',
                    labelText: '내용',
                  ),
                  maxLines: 6,
                ),
                SizedBox(height: 24.0),
                _isLoading ? new CircularProgressIndicator() : submitBnt
              ],
            ),
          ),
        ),
      ),
    );
  }
}
