import 'package:flutter/material.dart';
import 'package:wordpress_flutter/widgets/review_list.dart';
import 'dropMenu.dart';

class ReviewPage extends StatelessWidget {
//Build App
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        backgroundColor: Colors.black87,
      ),
      drawer: DropMenu(),
      body: Container(
        child: ReviewList(),
      ),
    );
  }
}
