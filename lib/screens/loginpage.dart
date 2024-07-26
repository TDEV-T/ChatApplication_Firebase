import 'package:chat_app/components/ButtonCustom.dart';
import 'package:chat_app/components/TextFieldCustom.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';


class Loginpage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  Loginpage({super.key,required this.onTap});




  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    try{
     await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString()),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
            ),

            //welcome msg
            Text("Welcome back, you've bee missed !",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize:16,
              ),
            ),
            const SizedBox(height:25),

            //form
            TextFieldCustom(
            hintText: "Email ",secure: false,
              controller:  _emailController,
            ),

            const SizedBox(height:10),

            TextFieldCustom(
            hintText: "Password ",secure: true,
              controller:  _passwordController,
            ),

            const SizedBox(height:25),

            //login button
            ButtonCustom(text: "Login",onTap: () => login(context),),
            const SizedBox(height:25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member? "),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
      ),
      )
    );
  }
}
