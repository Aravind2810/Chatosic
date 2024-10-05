// import 'package:chatosic/pages/loginview.dart';
// import 'package:chatosic/pages/registerationpage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class Welcome1page extends StatefulWidget {
//   const Welcome1page({super.key});
//
//   @override
//   State<Welcome1page> createState() => _Welcome1pageState();
// }
//
// class _Welcome1pageState extends State<Welcome1page> with SingleTickerProviderStateMixin {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isLogin = true;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _authenticate() async {
//     try {
//       if (_isLogin) {
//         await _auth.signInWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//       }
//         else {
//         await _auth.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//       }
//       // Navigate to the home page or any other page after successful authentication
//
//       Navigator.pushNamed(context, 'login_view');
//
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     }
//   }
//
//   void _toggleFormMode() {
//     setState(() {
//       _isLogin = !_isLogin;
//     });
//     _controller.forward(from: 0.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _buildHeader(),
//               SizedBox(height: 30),
//               _buildForm(),
//               SizedBox(height: 20),
//               _buildSubmitButton(),
//               SizedBox(height: 10),
//               _buildSwitchAuthModeButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
//
//   Widget _buildHeader() {
//     return Column(
//       children: [
//         Text(
//           _isLogin ? 'Welcome Back!' : 'Create Account',
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.blueAccent,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           _isLogin ? 'Login to continue' : 'Sign up to get started',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildForm() {
//     return Column(
//       children: [
//         if (!_isLogin)
//           _buildTextField(
//             controller: _nameController,
//             label: 'Name',
//             icon: Icons.person,
//           ),
//         SizedBox(height: 20),
//         _buildTextField(
//           controller: _emailController,
//           label: 'Email',
//           icon: Icons.email,
//           keyboardType: TextInputType.emailAddress,
//         ),
//         SizedBox(height: 20),
//         _buildTextField(
//           controller: _passwordController,
//           label: 'Password',
//           icon: Icons.lock,
//           isPassword: true,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     bool isPassword = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.blueAccent),
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _authenticate,
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.symmetric(vertical: 15),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: Text(
//           _isLogin ? 'Login' : 'Sign Up',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSwitchAuthModeButton() {
//     return TextButton(
//       onPressed: _toggleFormMode,
//       child: Text(
//         _isLogin ? 'Don\'t have an account? Sign Up' : 'Already have an account? Login',
//         style: TextStyle(color: Colors.blueAccent, fontSize: 16),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to the Home Page!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
//
//
// }
