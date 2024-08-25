import 'package:chat_app_firebase/pages/register_page.dart';
import 'package:chat_app_firebase/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 88, 32, 156),
      appBar: AppBar(
        title: const Text('Login Page', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/icon-removebg-preview.png')),
            const SizedBox(height: 16.0),
            const Text(
              'BuzzChat',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 65, 199, 226),
              ),
            ),

            const SizedBox(height: 48.0),
            /*TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),*/
            Container(
              height: 60,
              width: 200,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 202, 202),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: const Color.fromARGB(255, 202, 147, 147),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.email_rounded),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Email",
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            /*TextField(
              controller: _passwordController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Password',
                fillColor: Colors.blueGrey,
                filled: true

              ),
              obscureText: true,
            ),*/
            Container(
              height: 60,
              width: 200,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 202, 202),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: const Color.fromARGB(255, 202, 147, 147),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.lock),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _passwordController,
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Password",
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          
            
            const SizedBox(height: 28.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  _login();
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 16.0),
            //register page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Register',style: TextStyle(color: Color.fromARGB(255, 195, 215, 103)),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  const MainPage()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'))
                ],
              ));
    }
  }
}
