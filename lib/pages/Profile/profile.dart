import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truth_bit/pages/homepage.dart';
import 'package:truth_bit/services/auth/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? firebaseUser;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loggedIn = false;
  @override
  void initState() {
    super.initState();
    firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.currentUser != null
        ? loggedIn = true
        : loggedIn = false;
  }

  void signIn() async {
    AuthService authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void signOut() async {
    AuthService authService = AuthService();

    try {
      await authService.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        centerTitle: false,
        title: loggedIn ? const Text("Profile") : const Text("Welcome back!"),
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: loggedIn ? profilePage() : loginPage()),
    );
  }

  Widget profilePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(
            "assets/logo_truthbit.png",
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 2,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "User Details",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          firebaseUser!.email.toString(),
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 2,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "We trust in your ability to accurately classify the news. Your discernment and dedication help ensure that our platform maintains the highest standards of accuracy and reliability.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Thank you for being a vital part of our community.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.primary),
        ),
        const Spacer(),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 2,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              signOut();
            },
            child: const Text(
              "Sign out",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }

  Widget loginPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(
            "assets/logo_truthbit.png",
            fit: BoxFit.contain,
          ),
        ),
        const Text(
          'Please enter your username and password to access your Classifier account.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 25,
        ),
        TextField(
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          controller: emailController,
          obscureText: false,
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        TextField(
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              signIn();
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 2,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Note that new registrations are not allowed from this page. If you do not have an account or need assistance, please contact support.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
