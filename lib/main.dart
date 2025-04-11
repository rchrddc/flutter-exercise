import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/user_list/view_model/user_list_view_model.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/api_service.dart';
import 'ui/user_list/widgets/user_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserListViewModel(
            userRepository: UserRepository(apiService: ApiService()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue[900],
          selectionColor: Colors.blue.withOpacity(0.3),
          selectionHandleColor: Colors.blue[900],
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
      ),
      home: const UserListScreen(),
    );
  }
}
