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
  //각 탭마다 들어갈 11개의 메뉴 리스트 만듬. 빈 리스트로
  var menus = new List<List<MenuModel>>.generate(11, (_) => []);

  //워드프레스에서 메뉴 데이터를 불러옴(menuID -> menus 리스트에 넣어줄 index, categoryId -> 워드프레스에서 불러올 카테고리 ID)
  void fetchMenu(int menusId, int categoryId) async {
    //워드프레스에서 json파일을 불러와서 response에 저장
    final response = await get(
        'http://wordpresscafe.dothome.co.kr/wp-json/wp/v2/posts?categories=' +
            categoryId.toString());

    //response를 json으로 decode하고 각 json 데이터 한개씩(menuData)마다 menus[menusId]에 저장
    json.decode(response.body).forEach((dynamic menuData) {
      //임시로 추가할 menu 만듬. MenuModel.fromJson은 네임드 생성자.
      final MenuModel menu = MenuModel.fromJson(menuData);
      //메뉴 리스트에 추가. 메뉴가 추가될때마다 setState하여 MenuPageState을 다시 불러옴
      setState(() {
        menus[menusId].add(menu);
      });
    });
  }

  //처음 MenuPageState에 들어오면 fetchMenu 실행
  @override
  void initState() {
    super.initState();
    // fetchMenu(0, 12);
    // fetchMenu(1, 13);
    // fetchMenu(2, 14);
    // fetchMenu(3, 15); //커피
    // fetchMenu(4, 17);
    // fetchMenu(5, 18);
    // fetchMenu(6, 19);
    // fetchMenu(7, 20); //푸드
    // fetchMenu(8, 22);
    // fetchMenu(9, 23);
    // fetchMenu(10, 24); //기타
    fetchMenu(0, 11);
    fetchMenu(1, 16);
    fetchMenu(2, 21);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("전체메뉴"),
          backgroundColor: Colors.black87,
          // bottom: TabBar(
          //   labelColor: Color.fromRGBO(160, 134, 86, 1.0),
          //   indicatorColor: Color.fromRGBO(160, 134, 86, 1.0),
          //   unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
          //   tabs: [
          //     Tab(text: "커피"),
          //     Tab(text: "음료"),
          //     Tab(text: "디저트"),
          //   ],
          // ),
        ),
        drawer: DropMenu(),
        body: TabBarView(
          children: [
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
                      Tab(text: "커피"),
                      Tab(text: "음료"),
                      Tab(text: "디저트"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    MenuList(menus[0]), //MenuList 위젯 실행(menu_list.dart에 존재)
                    MenuList(menus[1]),
                    MenuList(menus[2]),
                  ],
                ),
              ),
            ),
            // DefaultTabController(
            //   length: 4,
            //   child: Scaffold(
            //     appBar: AppBar(
            //       automaticallyImplyLeading: false,
            //       backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
            //       title: TabBar(
            //         labelColor: Color.fromRGBO(0, 0, 0, 1.0),
            //         indicatorColor: Color.fromRGBO(0, 0, 0, 1.0),
            //         unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
            //         tabs: [
            //           Tab(text: "NEW"),
            //           Tab(text: "커피"),
            //           Tab(text: "음료"),
            //           Tab(text: "차"),
            //         ],
            //       ),
            //     ),
            //     body: TabBarView(
            //       children: [
            //         MenuList(menus[0]), //MenuList 위젯 실행(menu_list.dart에 존재)
            //         MenuList(menus[1]),
            //         MenuList(menus[2]),
            //         MenuList(menus[3]),
            //       ],
            //     ),
            //   ),
            // ),
            // DefaultTabController(
            //   length: 4,
            //   child: Scaffold(
            //     appBar: AppBar(
            //       automaticallyImplyLeading: false,
            //       backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
            //       title: TabBar(
            //         labelColor: Color.fromRGBO(0, 0, 0, 1.0),
            //         indicatorColor: Color.fromRGBO(0, 0, 0, 1.0),
            //         unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
            //         tabs: [
            //           Tab(text: "NEW"),
            //           Tab(text: "베이커리"),
            //           Tab(text: "케이크"),
            //           Tab(text: "샌드위치"),
            //         ],
            //       ),
            //     ),
            //     body: TabBarView(
            //       children: [
            //         MenuList(menus[4]),
            //         MenuList(menus[5]),
            //         MenuList(menus[6]),
            //         MenuList(menus[7]),
            //       ],
            //     ),
            //   ),
            // ),
            // DefaultTabController(
            //   length: 3,
            //   child: Scaffold(
            //     appBar: AppBar(
            //       automaticallyImplyLeading: false,
            //       backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
            //       title: TabBar(
            //         labelColor: Color.fromRGBO(0, 0, 0, 1.0),
            //         indicatorColor: Color.fromRGBO(0, 0, 0, 1.0),
            //         unselectedLabelColor: Color.fromRGBO(255, 255, 255, 1.0),
            //         tabs: [
            //           Tab(text: "원두커피"),
            //           Tab(text: "머그"),
            //           Tab(text: "텀블러"),
            //         ],
            //       ),
            //     ),
            //     body: TabBarView(
            //       children: [
            //         MenuList(menus[8]),
            //         MenuList(menus[9]),
            //         MenuList(menus[10]),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
