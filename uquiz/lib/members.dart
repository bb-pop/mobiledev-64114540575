import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final pb = PocketBase('https://127.0.0.1:8090');
    final email = 'anna@ubu.ac.th';
    final password = 'anna878888';
    pb.collection('users').authWithPassword(email, password);
    if (pb.authStore.isValid) {
      final members = pb.collection('members').getList(page: 1, perPage:20);
    }
    return const Placeholder();
  }
}