import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

bool _isLogin = true;

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _entredEmail = '';
  var _entredPassword = '';
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      debugPrint(_entredEmail);
      debugPrint(_entredPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20, right: 20, left: 20),
              width: 200,
              child: Image(image: AssetImage('assets/images/chat .png')),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Email Adress'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'please enter valid email address';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _entredEmail = newValue!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password muset be least 6 charecters long';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _entredPassword = newValue!;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          onPressed: () {},
                          child: Text(_isLogin ? 'Login' : 'Signup'),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = _isLogin ? false : true;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Creat Account'
                                : 'I already have an account'))
                      ],
                    )),
              )),
            )
          ],
        )),
      ),
    );
  }
}
