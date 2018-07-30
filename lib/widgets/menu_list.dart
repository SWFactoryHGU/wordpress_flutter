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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuDetailPage(menus[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Image.network(menus[index].thumbnail, height: 80.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                menus[index].title,
                                // textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Text(
                              "\$${menus[index].price}",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
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
