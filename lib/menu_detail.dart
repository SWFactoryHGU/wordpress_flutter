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
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Image.network(menu.image,
                    width: 500.0, alignment: Alignment.center),
              ),
              Text("가격 : \$${menu.price}"),
              Text(menu.info),
              // Text(menu.excerpt.substring(3, menu.excerpt.length - 5)),
            ],
          ),
        ),
      ),
    );
  }
}
