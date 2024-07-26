import "package:flutter/material.dart";

class Usertile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const Usertile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                const Icon(Icons.person),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(text),
                )
              ],
            ),
          ),
        ));
  }
}
