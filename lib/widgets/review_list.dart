import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wordpress_flutter/review_detail.dart';

import '../models/post_model.dart';

import 'package:http/http.dart' show get;

class ReviewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReviewListState();
  }
}

class ReviewListState extends State<ReviewList> {
  List<PostModel> reviews = [];

  void fetchreview() async {
    final response = await get(
      'http://wordpresscafe.dothome.co.kr/wp-json/wp/v2/posts?_embed&categories=29',
      // headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here",},
    );

    json.decode(response.body).forEach((dynamic reviewData) {
      final PostModel review = PostModel.fromJson(reviewData);
      setState(() {
        reviews.add(review);
      });
    });
  }

  @override
  void initState() {
    fetchreview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (reviews.isNotEmpty) {
      return ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewDetailPage(reviews[index]),
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
                      reviews[index].title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        reviews[index].date.toString().substring(0, 10),
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
