import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/kernel/widgets/custom_text_field_password.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear cuenta"),
        backgroundColor: Colors.pink,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images.png', width: 200, height: 200),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Correo electronico',
                        labelText: 'Correo electrónico',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFieldPassword(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFieldPassword(
                      controller: _confirmPassword,
                      hintText: 'Confirmar Contraseña',
                      labelText: 'Confirmar Contraseña',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            try {
                              final credential = FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('Email not valid');
                              } else if (e.code == 'wrong-password') {
                                print('Error in password');
                              }
                            }
                          },
                          child: const Text('Crear cuenta')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
