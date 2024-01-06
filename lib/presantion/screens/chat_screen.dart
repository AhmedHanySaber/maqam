import 'package:flutter/material.dart';
import 'package:maqam/constants.dart';
import 'package:provider/provider.dart';

import '../../data/models/Message_model.dart';

// Replace with the actual file name

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: Consumer<List<Message>>(
          //     builder: (context, messages, child) {
          //       return ListView.builder(
          //         itemCount: messages.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(messages[index].sender),
          //             subtitle: Text(messages[index].text),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Green,
                  ),
                  onPressed: () {
                    // Handle sending messages
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}