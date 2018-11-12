import 'package:flutter/material.dart';

import 'models/post_model.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class NoticeDetailPage extends StatelessWidget {
  final PostModel notice;

  NoticeDetailPage(this.notice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("공지사항"), backgroundColor: Colors.black87),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(), bottom: BorderSide())),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notice.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      notice.date.toString().substring(0, 10),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: HtmlView(data: notice.content),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("목록"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
