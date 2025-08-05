import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleRouteListPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> routes;

  const SimpleRouteListPage({super.key, required this.title, required this.routes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = routes[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(item['route']!);
              },
              child: Text(item['title'] ?? ''),
            ),
          );
        },
        itemCount: routes.length,
      ),
    );
  }
}
