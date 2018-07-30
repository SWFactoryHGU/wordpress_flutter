import 'package:flutter/material.dart';

import 'models/menu_model.dart';

class MenuDetailPage extends StatelessWidget {
  final MenuModel menu;

  MenuDetailPage(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menu.title), backgroundColor: Colors.black87),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Image.network(menu.image,
                    width: 500.0, alignment: Alignment.center),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(menu.title,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
              ),
              Text(menu.info),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  "\$${menu.price}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
              ),
              // Text(menu.excerpt.substring(3, menu.excerpt.length - 5)),
            ],
          ),
        ),
      ),
    );
  }
}
