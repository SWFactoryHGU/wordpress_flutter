import 'package:flutter/material.dart';
import 'package:wordpress_flutter/dropMenu.dart';

import 'package:wordpress_flutter/home.dart';

void main() {
  runApp(MenuPage());
}
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // theme: new ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Colors.pink[800], //Changing this will change the color of the TabBar
      //   accentColor: Colors.cyan[600],
      // ),
    
      home: DefaultTabController(
        length: 3,
        
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(0,0,0,1.0),
            bottom: TabBar(
              labelColor:Color.fromRGBO(160,134,86,1.0) ,
              indicatorColor: Color.fromRGBO(160,134,86,1.0) ,
              unselectedLabelColor: Color.fromRGBO(255,255,255,1.0) ,
              tabs: [
                Tab(text: "음료"),
                Tab(text: "푸드"),
                Tab(text: "원두/기타"),
                
              ],
            ),
            
            title: new Row(
              children: <Widget>[
                      
                        new Expanded(child: new Text("전체메뉴", textAlign: TextAlign.center,)),
                          new IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );},),
                        new Icon(Icons.search),
  ]
),

          ),
         
          drawer: DropMenu(),
          
          body: TabBarView(
            children: [
DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(160,134,86,1.0) ,
            title: TabBar(
              labelColor:Color.fromRGBO(0,0,0,1.0) ,
              indicatorColor: Color.fromRGBO(0,0,0,1.0) ,
              unselectedLabelColor: Color.fromRGBO(255,255,255,1.0) ,
              
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
              Text("신메뉴 리스트가 준비중입니다"),
              Text("에스프레소 리스트가 준비중입니다"),
              Text("디카페인 리스트가 준비중입니다"),
              Text("병음료 리스트가 준비중입니다"),
            ],
          ),
        ),
      ),  
DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar( backgroundColor: Color.fromRGBO(160,134,86,1.0) ,
            title: TabBar(
              labelColor:Color.fromRGBO(0,0,0,1.0) ,
              indicatorColor: Color.fromRGBO(0,0,0,1.0) ,
              unselectedLabelColor: Color.fromRGBO(255,255,255,1.0) ,
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
          appBar: AppBar( backgroundColor: Color.fromRGBO(160,134,86,1.0) ,
            title: TabBar(
              labelColor:Color.fromRGBO(0,0,0,1.0) ,
              indicatorColor: Color.fromRGBO(0,0,0,1.0) ,
              unselectedLabelColor: Color.fromRGBO(255,255,255,1.0) ,
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
      ),
    );
  }
}

