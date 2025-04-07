import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/user_list_view_model.dart';
import 'custom_card.dart';
import 'user_detail_screen.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return CustomCard(
                  imageUrl: user.avatar,
                  title: "${user.firstName} ${user.lastName}",
                  subtitle: user.email,
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
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => UserFormScreen(), // null = create mode
            ),
          );
        },
        tooltip: 'Add User',
        backgroundColor: Colors.blue[700],
        shape: CircleBorder(),
        child: Icon(Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
