import 'package:flutter/material.dart';

class client_details extends StatelessWidget {
  Map<String,dynamic>  user;
  client_details({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user['nome']),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(user['bi']),
              Text(user['nome']),
              Text(user['morrada']),
              Text(user['telefone']),
              Text(user['numero_carta']),
              Text(user['cargo']),
              Text(user['email']),
              Text(user['logado'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
