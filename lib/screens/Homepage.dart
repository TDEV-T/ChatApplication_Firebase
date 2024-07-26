import "package:chat_app/components/DrawerContent.dart";
import "package:chat_app/components/Usertile.dart";
import "package:chat_app/screens/chat_page.dart";
import "package:chat_app/services/auth_service.dart";
import "package:chat_app/services/chat_service.dart";
import "package:flutter/material.dart";

class Homepage extends StatelessWidget {
  Homepage({super.key});

  //chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    final _authservice = AuthService();

    _authservice.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HomePage"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout_outlined))
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: Drawercontent(),
      body: _builderUserList(),
    );
  }

  Widget _builderUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error !");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading ..");
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _builderUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _builderUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return Usertile(
          text: userData["email"],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              ),
            );
          });
    } else {
      return Container();
    }
  }
}
