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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(user['nome'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['bi'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['morrada'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['telefone'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['numero_carta'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['cargo'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['email'],textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
                Text(user['logado'].toString(),textAlign: TextAlign.justify, style: TextStyle(fontFamily: 'varela',fontSize: 16.0,fontWeight:FontWeight.bold ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
