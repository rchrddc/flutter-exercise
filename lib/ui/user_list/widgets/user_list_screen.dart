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

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
          bottom: TabBar.secondary(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.white),
            ),
            tabs: [
              Tab(text: 'All Users'),
              Tab(text: 'Active'),
              Tab(text: 'Inactive'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            viewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
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
            Center(child: Text('No Active Users Found')), // Placeholder for Active Users
            Center(child: Text('No Inactive Users Found')), // Placeholder for Inactive Users
          ],
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
          backgroundColor: Colors.blue[900],
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
