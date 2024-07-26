import "package:chat_app/screens/settings_page.dart";
import "package:flutter/material.dart";

import "../services/auth_service.dart";

class Drawercontent extends StatelessWidget {
  const Drawercontent({super.key});



  void logout(){
    final _authservice = AuthService();

    _authservice.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //Header Icon
              DrawerHeader(child:
                Center(
                  child: Icon(Icons.message,color: Theme.of(context).colorScheme.primary,size:40,),
                ),
                decoration: BoxDecoration(border: Border.all(width: 0)),

              ),

              //Menu
              Padding(
                padding: const EdgeInsets.only(left:25.0),
                child: ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:25.0),
                child: ListTile(
                title: const Text("Setting"),
                leading: const Icon(Icons.settings),
                onTap: (){
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage())
                  );
                },
                ),
              ),
            ],
          ),

          Padding(padding: const EdgeInsets.only(left:25.0,bottom:25.0),
            child:ListTile(
              title: const Text("Logout"),
              leading: const Icon(Icons.logout_rounded),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
