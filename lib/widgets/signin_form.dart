import 'package:euclidean_face_recog/models/user.model.dart';
import 'package:euclidean_face_recog/widgets/app_button.dart';
import 'package:euclidean_face_recog/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({super.key, required this.user});
  final User user;

  final _passwordController = TextEditingController();

  Future _signIn(context, user) async {
    if (user.password == _passwordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Hello, ${user.user}'),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Wrong password!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome back, ${user.user}.',
            style: const TextStyle(fontSize: 20),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              AppTextField(
                controller: _passwordController,
                labelText: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              AppButton(
                text: 'LOGIN',
                onPressed: () async {
                  _signIn(context, user);
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
