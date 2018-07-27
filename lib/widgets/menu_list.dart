import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../models/media_model.dart';
import '../menu_detail.dart';

import 'package:http/http.dart' show get;

class MenuList extends StatefulWidget {
  final int categoryId;

  MenuList(this.categoryId);

  @override
  State<StatefulWidget> createState() {
    return MenuListState();
  }
}

class MenuListState extends State<MenuList> {
  List<PostModel> menus = [];
  List<MediaModel> menusImage = [];

  @override
  void initState() {
    fetchPost(widget.categoryId);
    super.initState();
  }

  void fetchPost(int categoryId) async {
    var response = await get(
        'http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/posts?categories=' +
            categoryId.toString());

    List<dynamic> menuListData = json.decode(response.body);

    menuListData.forEach((dynamic menuData) {
      final PostModel menu = PostModel.fromJson(menuData);
      if (menu.featuredMedia != 0) {
        // fetchMedia(menu.featuredMedia);
        get('http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/media/' +
            menu.featuredMedia.toString()).then((mediaResponse) {
          MediaModel featureImage =
              MediaModel.fromJson(json.decode(mediaResponse.body));
          setState(() {
            menusImage.add(featureImage);
            menus.add(menu);
          });
        });
      }
    });
  }

  // void fetchMedia(int id) async {
  //   final mediaResponse = await get(
  //       'http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/media/' +
  //           id.toString());

  //   MediaModel featureImage =
  //       MediaModel.fromJson(json.decode(mediaResponse.body));

  //   menusImage.add(featureImage.guid);
  // }

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
                          menus[index], menusImage[index].source_url)),
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
