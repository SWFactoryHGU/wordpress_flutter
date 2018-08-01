import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dropMenu.dart';
import 'widgets/notice_list.dart';

//Carousel Slider
final List<String> imgList = [
  'http://dnjemvmfptm1.dothome.co.kr/wp-content/uploads/2018/07/header-bg-1.jpg',
  'http://dnjemvmfptm1.dothome.co.kr/wp-content/uploads/2018/07/section-bg-7.jpg',
  'http://dnjemvmfptm1.dothome.co.kr/wp-content/uploads/2018/07/gallery-coffee-image-11.jpg',
];

final Widget placeholder = new Container(color: Colors.grey);

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class NoticePage extends StatelessWidget {
  CarouselSlider instance;

  nextSlider() {
    instance.nextPage(
        duration: new Duration(milliseconds: 300), curve: Curves.linear);
  }

  prevSlider() {
    instance.previousPage(
        duration: new Duration(milliseconds: 800), curve: Curves.easeIn);
  }

//Build App
  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      items: imgList.map((url) {
        return new Container(
            margin: new EdgeInsets.all(5.0),
            child: new ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                child: new CachedNetworkImage(
                  imageUrl: url,
                  placeholder: placeholder,
                  fit: BoxFit.cover,
                  width: 1000.0,
                )));
      }).toList(),
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
    );
    return new Scaffold(
        appBar: AppBar(
          title: const Text('What\'s New'),
          backgroundColor: Colors.black87,
          actions: <Widget>[
            new IconButton(
              icon: ImageIcon(
                new AssetImage("assets/ring.png"),
              ),
              tooltip: '공지',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticePage()),
                );
              },
            ),
          ],
        ),
        drawer: DropMenu(),
        body: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(
                top: 10.0,
              ),
              child: instance,
            ),
            new Text(
              "\n워드프레스 카페의 새로운 소식을 볼 수 있는 서비스입니다.\n",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(225, 225, 225, 1.0),
                fontWeight: FontWeight.bold,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(
                bottom: 10.0,
              ),
              child: new NoticeList(),
            ),
            Text("data"),
          ],
        ));
  }
}
