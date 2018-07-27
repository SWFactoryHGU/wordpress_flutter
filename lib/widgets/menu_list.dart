import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../models/media_model.dart';
import '../menu_detail.dart';

class MenuList extends StatelessWidget {
  final List<PostModel> menus;
  final List<MediaModel> menusImage;

  MenuList(this.menus, this.menusImage);

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => MenuDetailPage(
                        menus[index], menusImage[index].source_url),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Image.network(menusImage[index].thumbnail, height: 50.0),
                  Expanded(
                    child:
                        Text(menus[index].title, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
