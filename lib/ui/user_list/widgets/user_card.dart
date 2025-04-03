import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  UserCard({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        title: Text("${user.firstName} ${user.lastName}"),
        subtitle: Text(user.email),
        onTap: onTap,
      ),
    );
  }
}
