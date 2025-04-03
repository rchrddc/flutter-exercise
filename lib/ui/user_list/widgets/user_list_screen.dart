import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/user_list_view_model.dart';
import 'user_card.dart';
import 'user_detail_screen.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: Consumer<UserListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: viewModel.users.length,
            itemBuilder: (context, index) {
              final user = viewModel.users[index];
              return UserCard(
                user: user,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
