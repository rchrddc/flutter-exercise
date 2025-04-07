import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/user.dart';
import '../view_model/user_list_view_model.dart';

class UserFormScreen extends StatefulWidget {
  final User? user; // Null means create, not null means edit

  const UserFormScreen({super.key, this.user});

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _avatarController;

  @override
  void initState() {
    super.initState();
    // If editing, populate with existing data
    _firstNameController = TextEditingController(text: widget.user?.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.user?.lastName ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _avatarController = TextEditingController(text: widget.user?.avatar ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

void _saveUser() {
  if (_formKey.currentState!.validate()) {
    final viewModel = Provider.of<UserListViewModel>(context, listen: false);

    final newUser = User(
      id: widget.user?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      avatar: _avatarController.text,
    );

    if (widget.user == null) {
      viewModel.addUser(newUser); // Add new user
    } else {
      viewModel.updateUser(newUser); // Update existing user
    }

    // Return the updated user back to the previous screen
    Navigator.pop(context, newUser); // Pass the updated user
  }
}


  @override
  Widget build(BuildContext context) {
    final isEditing = widget.user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit User' : 'Add User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField("First Name", _firstNameController),
                _buildTextField("Last Name", _lastNameController),
                _buildEmailField("Email", _emailController),
                _buildTextField("Avatar URL", _avatarController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700], // Material 3 color
                  ),
                  child: Text(isEditing ? 'Update User' : 'Create User',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Updated _buildTextField method with Material 3 style
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Material 3 behavior
          hintText: 'Enter $label', // Hint text that shows in the field
          helperText: 'Required Field *', // Supporting text below the field
          helperStyle: TextStyle(color: Colors.grey[600]), // Style for helper text
          border: OutlineInputBorder(), // Default border for text fields
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
      ),
    );
  }

  // Updated email field with email validation and Material 3 style
  Widget _buildEmailField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Floating label behavior
          hintText: 'Enter your email', // Hint text
          helperText: 'Required Field *', // Helper text
          helperStyle: TextStyle(color: Colors.grey[600]), // Helper text style
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required field';
          }
          // Email regex pattern
          String pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null; // Valid email
        },
      ),
    );
  }
}
