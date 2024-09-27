import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends StatelessWidget {
  final Future<QuerySnapshot<Map<String, dynamic>>> futureCall;
  final Widget Function(BuildContext context, List<T> data) builder;
  final T Function(QueryDocumentSnapshot<Map<String, dynamic>> doc) fromJson;

  const MyFutureBuilder({
    super.key,
    required this.futureCall,
    required this.builder,
    required this.fromJson,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: futureCall,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          print('Error occured in: ${snapshot.error}');
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || (snapshot.data?.docs.isEmpty ?? false)) {
          return const Center(
            child: Text('No data found'),
          );
        }

        var dataList = List<T>.from(
          snapshot.data!.docs.map((e) => fromJson(e)).toList(),
        );

        return builder(ctx, dataList);
      },
    );
  }
}
