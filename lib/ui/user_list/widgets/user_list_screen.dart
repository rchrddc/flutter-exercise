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

    // Filters
    final allUsers = viewModel.users;
    final activeUsers = allUsers.where((user) => user.isActive).toList();
    final inactiveUsers = allUsers.where((user) => !user.isActive).toList();

    Widget buildUserGrid(List users) {
      if (viewModel.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (users.isEmpty) {
        return const Center(child: Text('No Users Found'));
      }

      return GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return CustomCard(
            imageUrl: user.avatar,
            title: "${user.firstName} ${user.lastName}",
            subtitle: user.email,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UserDetailScreen(user: user),
                ),
              );
            },
          );
        },
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
          bottom: TabBar.secondary(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.white),
            ),
            tabs: const [
              Tab(text: 'All Users'),
              Tab(text: 'Active'),
              Tab(text: 'Inactive'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildUserGrid(allUsers),
            buildUserGrid(activeUsers),
            buildUserGrid(inactiveUsers),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const UserFormScreen(),
              ),
            );
          },
          tooltip: 'Add User',
          backgroundColor: Colors.blue[900],
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
