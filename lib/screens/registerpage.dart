import "package:chat_app/components/ButtonCustom.dart";
import "package:chat_app/components/TextFieldCustom.dart";
import "package:chat_app/services/auth_service.dart";
import "package:flutter/material.dart";

class Registerpage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordconfirmController = TextEditingController();

  final void Function()? onTap;


   Registerpage({super.key,required this.onTap});



  void register(BuildContext context) async {
    if(_passwordController.text == _passwordconfirmController.text){
      try{
        final authService = AuthService();
        await authService.signUpWithEmailPassword(_emailController.text, _passwordController.text);
      }catch(e){
         showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString()),));
      }
    }else{
      showDialog(context:context,builder: (context) => const AlertDialog(title: Text('Password and Password Confirm not match !')));
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
            Text("Let's create u account  !",
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

            const SizedBox(height:10),

            TextFieldCustom(
            hintText: "Password Confirm",secure: true,
              controller:  _passwordconfirmController,
            ),

            const SizedBox(height:25),

            //login button
            ButtonCustom(text: "Register",onTap: () => register(context),),
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
