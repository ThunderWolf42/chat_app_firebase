// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_model.dart';
class Channel {
  final String id;
  final List<String> memberIds;
  final String lastMessage;
  final Timestamp lastTime;
  final Map<String, bool> unRead;
  final List<UserModel> members;
  final String sendBy;
  Channel({
    required this.id,
    required this.memberIds,
    required this.lastMessage,
    required this.lastTime,
    required this.unRead,
    required this.members,
    required this.sendBy,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'memberIds': memberIds,
      'lastMessage': lastMessage,
      'lastTime': lastTime,
      'unRead': unRead,
      'members': members.map((x) => x.toMap()).toList(),
      'sendBy': sendBy,
    };
  }

  factory Channel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return Channel(
      id: snapshot.id,
      memberIds: List<String>.from(snapshot['memberIds']),
      members: List<UserModel>.from(
          snapshot['members']?.map((user) => UserModel.fromMap(user))),
      lastMessage: snapshot['lastMessage'] ?? '',
      sendBy: snapshot['sendBy'],
      lastTime: snapshot['lastTime'] as Timestamp,
      unRead: Map<String, bool>.from(snapshot['unRead']),
    );
  }
}
