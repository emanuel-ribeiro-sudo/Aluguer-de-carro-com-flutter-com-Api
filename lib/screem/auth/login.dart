import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rent_car/constants.dart';
import 'package:rent_car/screem/auth/create_account.dart';
import 'package:rent_car/screem/cliente/clientes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:SizedBox(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
              ),
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,

              child: SafeArea(
                child:  SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      const SizedBox(height: defaultPadding *4,),
                      Text("Login", style: Theme.of(context).textTheme.headline5!.
                      copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Row(
                        children: [
                          const Text("No have an account?",style: TextStyle(color: Colors.white),),
                          TextButton(onPressed: ()=> Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>const CreateAccountPage())),
                              child: const Text("Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ]),
                  Form(
                      key: _formkey,
                      child:SingleChildScrollView (
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: defaultPadding,),
                            const TextFieldNameLogin(text:"Email",),
                            TextFormField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Por favor, degite seu email';
                                } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(_emailController.text)) {
                                  return 'Por favor, digite um e-mail correto';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: "test@gmail.com",hintStyle: TextStyle(color: Colors.white)
                              ),
                            ),
                            const SizedBox(height: defaultPadding,),
                            const TextFieldNameLogin(text:"Password",),
                            TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(color: Colors.white),
                              obscureText: true,
                              validator: (senha){
                                if(senha==null || senha.isEmpty){
                                  return 'Por favor, degite uma senha';
                                }else if(senha.length<5){
                                  return 'Por favor, degite uma senha ,maior que 6 caracteres';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: "********",hintStyle: TextStyle(color: Colors.white)
                              ),
                            ),
                            const SizedBox(height: defaultPadding,),
                          ],
                        ),
                      )
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){},
                            child: const Text("Forgot Password?",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding *2,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed:  () async {
                          FocusScopeNode curentFocus = FocusScope.of(context);
                          if( _formkey.currentState!.validate()){
                            bool dacerto = await login();
                            if(!curentFocus.hasPrimaryFocus){
                              curentFocus.unfocus();
                            }
                            if (dacerto){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context)=>Clientes()));
                              }else{
                              _passwordController.clear();
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }
                        },
                        // =>Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>Clientes())),
                            child: const Text("Sign In")
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      ),
      )
    );
  }

  final snackBar = SnackBar(content: Text('Email ou senha incorrecta',
  textAlign: TextAlign.center,),backgroundColor: remColor,);
  Future<bool> login() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('http://localhost:3333/users/login');
    var resposta = await http.post(url,
        body:{
          "email": _emailController.text,
          "senha": _passwordController.text,
        });
    if(resposta.statusCode == 200){
      print(jsonDecode(resposta.body)['token']);
      return true;
    }else{
      print(jsonDecode(resposta.body));
      return false;
    }
  }
}



class TextFieldNameLogin extends StatelessWidget {
  const TextFieldNameLogin({
    Key? key,required this.text
  }):super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/3),
      child: Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}
