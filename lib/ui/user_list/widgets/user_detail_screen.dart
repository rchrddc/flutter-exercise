import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${user.firstName} ${user.lastName}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.avatar)),
            SizedBox(height: 10),
            Text("${user.firstName} ${user.lastName}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(user.email, style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
