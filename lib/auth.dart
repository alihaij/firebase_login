import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final _firebase = FirebaseAuth.instance;

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
  Future<void> _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (isValid) {
      _formKey.currentState!.save();
      debugPrint(_entredEmail);
      debugPrint(_entredPassword);
      // try {
      if (_isLogin) {
        //log users in
        // final UserCredential = await _firebase.signInWithEmailAndPassword(
        //     email: _entredEmail, password: _entredPassword);
        // print(UserCredential);
      } else {
        // final UserCredential = await _firebase.createUserWithEmailAndPassword(
        //     email: _entredEmail, password: _entredPassword);
        // print(UserCredential);
      }
      // } on FirebaseAuthException catch (error) {
      //   if (error.code == 'email-already-in-use') {}
      //   ScaffoldMessenger.of(context).clearSnackBars();
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text(error.message ?? 'Authentication faild.')));
      // }
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
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
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
