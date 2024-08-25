import 'package:chat_app_firebase/data/datasources/firebase_datasource.dart';

import 'package:chat_app_firebase/pages/widget/bubble_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/models/user_model.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final List names = [
    'user1',
    'user2',
    'user3',
    'user4',
    'user5 ',
    'user6',
    'user7',
    'user8'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 146, 146),
      appBar: AppBar(
        title: const Text('Chats',
            style: TextStyle(
                color: Color(0xFF4C7EB4),
                fontSize: 35,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BubbleStory(name: names[index]

                    // Use widget to access names
                    );
              },
              itemCount: names.length,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
                stream: FirebaseDatasource.instance.allUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final List<UserModel> users = (snapshot.data ?? [])
                      .where((element) => element.id != currentUser!.uid)
                      .toList();
                  //if user is null
                  if (users.isEmpty) {
                    return const Center(
                      child: Text('No user found'),
                    );
                  }
                  return ListView.separated(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/100?u=${users[index].id}'),
                          ),
                          title: Text(
                            users[index].userName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Last message'),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ChatPage(
                                partnerUser: users[index],
                              );
                            }));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      });
                }),
          ),
        ],
      ),
    );
  }
}
