import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../notice_detail.dart';

import 'package:http/http.dart' show get;

class NoticeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoticeListState();
  }
}

class NoticeListState extends State<NoticeList> {
  List<PostModel> notices = [];

  void fetchNotice() async {
    final response = await get(
        'http://dnjemvmfptm1.dothome.co.kr/wp-json/wp/v2/posts?_embed&categories=57',
        headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here",},
);

    json.decode(response.body).forEach((dynamic noticeData) {
      final PostModel notice = PostModel.fromJson(noticeData);
      setState(() {
        notices.add(notice);
      });
    });
  }

  @override
  void initState() {
    fetchNotice();
    super.initState();
  }

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
                    builder: (context) => NoticeDetailPage(notices[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notices[index].title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        notices[index].date.toString().substring(0, 10),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[600],
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
