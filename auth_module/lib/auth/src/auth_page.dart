import 'package:auth_module/auth/data/auth_impl.dart';
import 'package:auth_module/auth/models/auth_types/auth_creator/auth_selector.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  String email = '';
  String password = '';
  AuthImplementation authImpl = AuthImplementation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.key,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: authImpl.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key: Key('email-field'),
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator:(value)=> authImpl.validateEmail(value).messageError,
                  onChanged: (value) => setState(() => email = value),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  key: Key('password-field'),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value)=> authImpl.validatePassword(value).messageError,
                  onChanged: (value) => setState(() => password = value),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        key: Key('submit'),
                          onPressed: () async {
                            await authImpl.signIn(
                              context, 
                              email: email, 
                              password: password, 
                              authSelector: AvailableAuthProviders.EmailAndPassword
                            );
                          },
                          child: Text('Log in')),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
