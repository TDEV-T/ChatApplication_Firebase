import "package:chat_app/components/TextFieldCustom.dart";
import "package:chat_app/components/chat_bubble.dart";
import "package:chat_app/services/auth_service.dart";
import "package:chat_app/services/chat_service.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  final TextEditingController _msgController = TextEditingController();

  final ChatService _chat = ChatService();
  final AuthService _auth = AuthService();

  void sendMessage() async {
    if (_msgController.text.isNotEmpty) {
      await _chat.sendMessage(receiverID, _msgController.text);

      //clear text controller
      _msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildUserInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _auth.getCurrentUser()!.uid;
    if (kDebugMode) {
      print(receiverID);
    }
    return StreamBuilder(
        stream: _chat.getMsg(receiverID, senderID),
        builder: (context, snapshot) {
          //err
          if (snapshot.hasError) {
            return const Text("Error");
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading ...");
          }
          //return

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _auth.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [ChatBubble(msg: data["msg"], current: isCurrentUser)],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Expanded(
            child: TextFieldCustom(
              controller: _msgController,
              hintText: "typing .... ",
              secure: false,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.all(15),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward,
                  size: 25,
                )),
          )
        ],
      ),
    );
  }
}
