import 'package:flutter/material.dart';
import 'package:wordpress_flutter/review_write.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a review'),
        backgroundColor: Color.fromRGBO(160, 134, 86, 1.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReviewWritePage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: DropMenu(),
      body: Container(
        child: ReviewList(),
      ),
    );
  }
}
