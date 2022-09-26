import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/fGsNY24fpHQyaczRovFB/messages')
            .snapshots(),
        builder: (context, streamSnapshot) {
         if(streamSnapshot.connectionState == ConnectionState.waiting){
           return Center(
             child: CircularProgressIndicator(),
           );
         }
         final documents = streamSnapshot.data.documents;
          return ListView.builder(
              itemCount: streamSnapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  child: Text(documents[index]['text']),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance.collection('chats/fGsNY24fpHQyaczRovFB/messages').add({
            'text': 'This message is added by clicking the button'
          });
        },
      ),
    );
  }
}
