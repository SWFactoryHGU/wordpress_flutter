import 'package:flutter/material.dart';

import 'models/post_model.dart';

class MenuDetailPage extends StatelessWidget {
  final PostModel menu;
  final String menuImage;

  MenuDetailPage(this.menu, this.menuImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menu.title), backgroundColor: Colors.black87),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Image.network(menuImage, alignment: Alignment.center),
              ),
              Text(menu.excerpt.substring(3, menu.excerpt.length - 5)),
            ],
          ),
        ),
      ),
    );
  }
}
