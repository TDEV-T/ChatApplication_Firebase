import "package:chat_app/screens/loginpage.dart";
import "package:chat_app/screens/registerpage.dart";
import "package:flutter/material.dart";


class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {


  //init and show login page

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Loginpage(
        onTap: togglePages,
      );
    }else{
      return Registerpage(
        onTap: togglePages
      );
    }
  }
}
