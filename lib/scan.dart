import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wordpress_flutter/dropmenu.dart';
import 'package:wordpress_flutter/notice.dart';

class ScanPage extends StatefulWidget {
  @override
  ScanPageState createState() => new ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  String barcode = "";
  String _kSmallLogoImage = 'assets/qr-code.png';
  // String _kGalleryAssetsPackage = 'flutter_gallery_assets';
  double _kAppBarHeight = 128.0;
  double _kFabHalfSize = 28.0;
  double _kRecipePageMaxWidth = 500.0;
  double height = 100;
  double kLogoHeight = 70;
  double kLogoWidth = 70;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext contexst) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wordpress Cafe'),
          backgroundColor: Colors.black87,
          actions: <Widget>[
            new IconButton(
              icon: ImageIcon(
                new AssetImage("assets/ring.png"),
              ),
              tooltip: '공지',
              // iconSize: 150.0,
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
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150.0,
              color: Color.fromRGBO(64, 61, 60, 1),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: kLogoWidth,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            _kSmallLogoImage,
                            fit: BoxFit.contain,
                          ),
                          Text('SCAN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Hero(
                      tag: 'image hero',
                      child: AspectRatio(
                        aspectRatio: 4.0 / 3.0,
                        child: Image.asset(
                          'assets/program.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen()),
                      );
                    },
                  ),
                  Text('모바일 플랫폼으로의 확장',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30.0),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis),
                  Text('QR 코드!',
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                ],
              ),
            ),
          ],
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: new AppBar(
  //       title: new Text('E-Frequency'),
  //       backgroundColor: Colors.black87,
  //     ),
  //     body: new Center(
  //       child: new Column(
  //         children: <Widget>[
  //           new Container(
  //             child:
  //                 new MaterialButton(onPressed: scan, child: new Text("스캔하기")),
  //             padding: const EdgeInsets.all(8.0),
  //           ),
  //           // new Text(barcode),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}

_launchURL(url) async {
  // const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DetailScreen extends StatefulWidget {
  @override
  DetailScreenState createState() => new DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  String barcode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'image hero',
                child: AspectRatio(
                  aspectRatio: 4.0 / 3.0,
                  child: Image.asset(
                    'assets/program.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'QR code로 리뷰 쓰기',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 50.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                        '스마트폰의 보급에 따라 스마트폰으로 직접 QR코드를 스캔하면 그 결과를 손쉽게 받을 수 있습니다.'),
                    Text('워드프레스 카페에서 제공하는 QR코드를 카메라를 통해 메뉴를 확인해보세요!'),
                    RaisedButton(
                      child: Text('Scan', style: TextStyle(color: Colors.white),),
                      onPressed: scan,
                      color: Color.fromRGBO(160, 134, 86, 1.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
      _launchURL(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
