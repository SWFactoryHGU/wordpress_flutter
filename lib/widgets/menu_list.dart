import 'package:flutter/material.dart';

import '../models/menu_model.dart';

import '../menu_detail.dart';

class MenuList extends StatelessWidget {
  final List<MenuModel> menus;

  MenuList(this.menus);

  @override
  Widget build(BuildContext context) {
    if (menus.isNotEmpty) {
      return ListView.builder(
          itemCount: menus.length,
          itemBuilder: (context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuDetailPage(menus[index]),
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Image.network(menus[index].thumbnail, height: 80.0),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(menus[index].title, textAlign: TextAlign.center),
                          Text("\$${menus[index].price}",
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
