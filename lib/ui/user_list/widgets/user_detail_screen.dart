import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/user.dart';
import '../view_model/user_list_view_model.dart';
import 'user_form_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  void _deleteUser(BuildContext context) {
    Provider.of<UserListViewModel>(context, listen: false).deleteUser(user.id);
    Navigator.pop(context); // Pop this screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.firstName} ${user.lastName}"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              final updatedUser = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserFormScreen(user: user),
                ),
              );

              if (updatedUser != null) {
                setState(() {
                  user = updatedUser;
                });
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteUser(context), // 🗑 Delete button
          ),
        ],
      ),
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
