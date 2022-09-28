import 'package:chatapp_firebase/widgets/chat/messages.dart';
import 'package:chatapp_firebase/widgets/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onLaunch: (msg){
      print(msg);
      return;
    }, onResume: (msg){
      print(msg);
      return;
    });
    fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chat"),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Icon(Icons.more_vert, color: Colors.white,),
              items: [
                DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app, color: Colors.black,),
                          SizedBox(width: 8,),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier){
              if(itemIdentifier == 'logout'){
                FirebaseAuth.instance.signOut();
              }
              },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
