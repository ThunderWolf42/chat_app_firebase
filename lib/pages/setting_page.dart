import 'package:chat_app_firebase/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
   SettingsPage({super.key});
 final currentUser = FirebaseAuth.instance.currentUser;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromRGBO(42, 40, 40, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Settings',
            style: TextStyle(color: Color(0xFF4C7EB4)
            , fontSize: 35, fontWeight: FontWeight.bold
            
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
             Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=${currentUser?.displayName ?? ''}'), // Replace with image URL
                ),
                const SizedBox(width: 30),
                Text(
                  currentUser?.displayName ?? 'Farida', 
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color:  Color.fromRGBO(82, 198, 157, 1)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
                tileColor: const Color.fromARGB(255, 38, 89, 128),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20)
                ),
                title: const Text('Notification',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 205, 231, 73)),),
                onTap: () {
                  
                },
              ),
            const SizedBox(height: 20),
            ListTile(
                tileColor: const Color.fromARGB(255, 38, 89, 128),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20)
                ),
                title: const Text('Privacy',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 205, 231, 73)),),
                onTap: () {
                  
                },
              ),
            const SizedBox(height: 20),
            ListTile(
                tileColor: const Color.fromARGB(255, 38, 89, 128),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20)
                ),
                title: const Text('About',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 205, 231, 73)),),
                onTap: () {
                  
                },
              ),
            const SizedBox(height: 20),
            
            ListTile(
                tileColor: const Color.fromRGBO(162, 50, 50, 1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20)
                ),
                title: const Text('SignOut',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 205, 231, 73)),),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                },
              ),
          ],
        ),
      ),
      
    );
  }
}