import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/post_model.dart';
import 'package:wordpress_flutter/home.dart';

import 'package:http/http.dart' show get;

class NoticeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoticeListState();
  }
}

class NoticeListState extends State<NoticeList> {
  List<PostModel> notices = [];

  @override
  void initState() {
    fetchNotice();
    super.initState();
  }

  void fetchNotice() async {
    final response = await get(
        'http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/posts?categories=57');

    json.decode(response.body).forEach((dynamic noticeData) {
      final PostModel notice = PostModel.fromJson(noticeData);
      setState(() {
        notices.add(notice);
      });
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
    if (notices.isNotEmpty) {
      return ListView.builder(
          itemCount: notices.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
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
                    // Image.network(notice[index].thumbnail, height: 80.0),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("asd",
                                // notices[index].title,
                                // textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0),
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
