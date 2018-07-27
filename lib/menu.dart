import 'package:flutter/material.dart';
import 'dart:convert';

import 'dropMenu.dart';
import 'home.dart';
import 'widgets/menu_list.dart';
import 'models/post_model.dart';
import 'models/media_model.dart';

import 'package:http/http.dart' show get;

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuPageState();
  }
}

class MenuPageState extends State<MenuPage> {
  var menus = new List<List<PostModel>>.generate(11, (_) => []);
  var menusImage = new List<List<MediaModel>>.generate(11, (_) => []);

  void fetchPost(int menusId, int categoryId) async {
    final response = await get(
        'http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/posts?categories=' +
            categoryId.toString());

    // final List<PostModel> menuList = [];
    // final List<MediaModel> menuIamgeList = [];

    json.decode(response.body).forEach((dynamic menuData) {
      final PostModel menu = PostModel.fromJson(menuData);
      if (menu.featuredMedia != 0) {
        get('http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/media/' +
            menu.featuredMedia.toString()).then((mediaResponse) {
          MediaModel featureImage =
              MediaModel.fromJson(json.decode(mediaResponse.body));
          setState(() {
            menusImage[menusId].add(featureImage);
            menus[menusId].add(menu);
            // menuList.add(menu);
          });
        });
      }
      // setState(() {
      //   menus[menusId] = menuList;
      //   menusImage[menusId] = menuIamgeList;
      // });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPost(0, 1);
    fetchPost(1, 6);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black87,
          bottom: TabBar(
            labelColor: Color.fromRGBO(160, 134, 86, 1.0),
            indicatorColor: Color.fromRGBO(160, 134, 86, 1.0),
            unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
            tabs: [
              Tab(text: "음료"),
              Tab(text: "푸드"),
              Tab(text: "원두/기타"),
            ],
          ),
          title: Text("전체메뉴"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            Icon(Icons.search),
          ],
        ),
        drawer: DropMenu(),
        body: TabBarView(
          children: [
            DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
                  title: TabBar(
                    labelColor: Color.fromRGBO(0, 0, 0, 1.0),
                    indicatorColor: Color.fromRGBO(0, 0, 0, 1.0),
                    unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
                    tabs: [
                      Tab(text: "NEW"),
                      Tab(text: "에스프레소"),
                      Tab(text: "디카페인"),
                      Tab(text: "병음료"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    // Text("신메뉴 리스트가 준비중입니다"),
                    MenuList(menus[0], menusImage[0]), // 임시 카테고리
                    MenuList(menus[1], menusImage[1]),
                    // Text("에스프레소 리스트가 준비중입니다"),
                    Text("디카페인 리스트가 준비중입니다"),
                    Text("병음료 리스트가 준비중입니다"),
                  ],
                ),
              ),
            ),
            DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
                  title: TabBar(
                    labelColor: Color.fromRGBO(0, 0, 0, 1.0),
                    indicatorColor: Color.fromRGBO(0, 0, 0, 1.0),
                    unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
                    tabs: [
                      Tab(text: "NEW"),
                      Tab(text: "베이커리"),
                      Tab(text: "케이크"),
                      Tab(text: "샌드위치"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Text("신메뉴 리스트가 준비중입니다"),
                    Text("베이커리 리스트가 준비중입니다"),
                    ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text('생크림케이크'),
                        ),
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text('치즈케이크'),
                        ),
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text('초코케이크'),
                        ),
                      ],
                    ),
                    Text("샌드위치 리스트가 준비중입니다"),
                  ],
                ),
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
                  title: TabBar(
                    labelColor: Color.fromRGBO(0, 0, 0, 1.0),
                    indicatorColor: Color.fromRGBO(0, 0, 0, 1.0),
                    unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
                    tabs: [
                      Tab(text: "원두커피"),
                      Tab(text: "텀블러"),
                      Tab(text: "선물세트"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text('아이스 커피 블렌드 250g'),
                        ),
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text('에스트레소 로스트 250g'),
                        ),
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text('비아 바닐라 라떼 5개입'),
                        ),
                      ],
                    ),
                    Text("텀블러 리스트가 준비중입니다"),
                    Text("선물세트 리스트가 준비중입니다"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
