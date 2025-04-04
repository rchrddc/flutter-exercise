import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/user_list/view_model/user_list_view_model.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/api_service.dart';
import 'ui/user_list/widgets/user_list_screen.dart';

// class MyAppBar extends StatelessWidget {
//   const MyAppBar({required this.title, super.key});

//   // final Widget title;

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //     height: 56,
//   //     padding: const EdgeInsets.symmetric(horizontal: 8),
//   //     decoration: BoxDecoration(color: Colors.blue[500]),
//   //     child: Row(
//   //       children: [
//   //         const IconButton(
//   //           icon: Icon(Icons.menu),
//   //           tooltip: 'Navigation menu',
//   //           onPressed: null,
//   //         ),
//   //         Expanded(child: title),
//   //         const IconButton(
//   //           icon: Icon(Icons.search),
//   //           tooltip: 'Search',
//   //           onPressed: null,
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }

// class MyScaffold extends StatelessWidget {
//   const MyScaffold({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> users = [
//       {
//         "id": "7",
//         "email": "michael.lawson@reqres.in",
//         "first_name": "Michael",
//         "last_name": "Lawson",
//         "avatar": "https://reqres.in/img/faces/7-image.jpg"
//       },
//       {
//         "id": "8",
//         "email": "lindsay.ferguson@reqres.in",
//         "first_name": "Lindsay",
//         "last_name": "Ferguson",
//         "avatar": "https://reqres.in/img/faces/8-image.jpg"
//       },
//       {
//         "id": "9",
//         "email": "tobias.funke@reqres.in",
//         "first_name": "Tobias",
//         "last_name": "Funke",
//         "avatar": "https://reqres.in/img/faces/9-image.jpg"
//       },
//       {
//         "id": "10",
//         "email": "byron.fields@reqres.in",
//         "first_name": "Byron",
//         "last_name": "Fields",
//         "avatar": "https://reqres.in/img/faces/10-image.jpg"
//       },
//       {
//         "id": "11",
//         "email": "george.edwards@reqres.in",
//         "first_name": "George",
//         "last_name": "Edwards",
//         "avatar": "https://reqres.in/img/faces/11-image.jpg"
//       },
//       {
//         "id": "12",
//         "email": "rachel.howell@reqres.in",
//         "first_name": "Rachel",
//         "last_name": "Howell",
//         "avatar": "https://reqres.in/img/faces/12-image.jpg"
//       },
//       {
//         "id": "13",
//         "email": "michael.lawson@reqres.in",
//         "first_name": "Michael",
//         "last_name": "Lawson",
//         "avatar": "https://reqres.in/img/faces/7-image.jpg"
//       },
//       {
//         "id": "14",
//         "email": "lindsay.ferguson@reqres.in",
//         "first_name": "Lindsay",
//         "last_name": "Ferguson",
//         "avatar": "https://reqres.in/img/faces/8-image.jpg"
//       },
//       {
//         "id": "15",
//         "email": "tobias.funke@reqres.in",
//         "first_name": "Tobias",
//         "last_name": "Funke",
//         "avatar": "https://reqres.in/img/faces/9-image.jpg"
//       },
//       {
//         "id": "16",
//         "email": "byron.fields@reqres.in",
//         "first_name": "Byron",
//         "last_name": "Fields",
//         "avatar": "https://reqres.in/img/faces/10-image.jpg"
//       },
//       {
//         "id": "17",
//         "email": "george.edwards@reqres.in",
//         "first_name": "George",
//         "last_name": "Edwards",
//         "avatar": "https://reqres.in/img/faces/11-image.jpg"
//       },
//       {
//         "id": "18",
//         "email": "rachel.howell@reqres.in",
//         "first_name": "Rachel",
//         "last_name": "Howell",
//         "avatar": "https://reqres.in/img/faces/12-image.jpg"
//       }
//     ];

//     return Material(
//       child: Column(
//         children: [
//           MyAppBar(
//             title: Text(
//               'List Users',
//               style: Theme.of(context).primaryTextTheme.titleLarge,
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 var user = users[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                   elevation: 1,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.all(8),
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(user["avatar"]!),
//                     ),
//                     title: Text("${user["first_name"]} ${user["last_name"]}"),
//                     subtitle: Text(user["email"]!),
//                     // onTap: () => {
//                     //   Navigator.push(context,
//                     //   MaterialPageRoute(builder: (context) => DetailsScreen(user: user))),
//                     // },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   final User user;

//   DetailScreen({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("${user.firstName} ${user.lastName}")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(user.avatar),
//             ),
//             SizedBox(height: 16),
//             Text(
//               "${user.firstName} ${user.lastName}",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(user.email, style: TextStyle(fontSize: 18, color: Colors.grey)),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserListViewModel(
            userRepository: UserRepository(apiService: ApiService()),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: UserListScreen(),
      ),
    );
  }
}
void main() {
  runApp(MyApp());
}
