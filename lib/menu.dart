import 'package:flutter/material.dart';
import 'dart:convert';

import 'dropMenu.dart';
import 'widgets/menu_list.dart';
import 'models/menu_model.dart';

import 'package:http/http.dart' show get;

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuPageState();
  }
}

class MenuPageState extends State<MenuPage> {
  var menus = new List<List<MenuModel>>.generate(11, (_) => []);

  void fetchMenu(int menusId, int categoryId) async {
    final response = await get(
        'http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/menus?menucategories=' +
            categoryId.toString());

    json.decode(response.body).forEach((dynamic menuData) {
      final MenuModel menu = MenuModel.fromJson(menuData);
      setState(() {
        menus[menusId].add(menu);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMenu(0, 68);
    fetchMenu(1, 69);
    fetchMenu(2, 70);
    fetchMenu(3, 71); //커피
    fetchMenu(4, 72);
    fetchMenu(5, 73);
    fetchMenu(6, 74);
    fetchMenu(7, 75); //푸드
    fetchMenu(8, 76);
    fetchMenu(9, 77);
    fetchMenu(10, 78); //기타
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
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.arrow_back_ios),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Icon(Icons.search),
          // ],
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
                    MenuList(menus[0]),
                    MenuList(menus[1]),
                    MenuList(menus[2]),
                    MenuList(menus[3]),
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
                    MenuList(menus[4]),
                    MenuList(menus[5]),
                    MenuList(menus[6]),
                    MenuList(menus[7]),
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
                    MenuList(menus[8]),
                    MenuList(menus[9]),
                    MenuList(menus[10]),
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
