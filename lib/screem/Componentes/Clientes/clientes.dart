import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_car/screem/Componentes/Clientes/cliente_detail.dart';
import 'dart:convert';

import '../../../constants.dart';
class cliente_Page extends StatefulWidget {
  const cliente_Page({Key? key}) : super(key: key);

  @override
  _cliente_PageState createState() => _cliente_PageState();
}

class _cliente_PageState extends State<cliente_Page> {
  List cliente=[];
  List user=[];
  late Map dataUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: getCliente(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!['users'].length,
                itemBuilder: (context,index){
                  var usuario = snapshot.data!['users'][index];
              return ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> client_details(user: usuario,)));
                },
                leading: CircleAvatar(
                  child:Image.asset('assets/perfil.png')
                  // Text('${usuario['bi'].toString()}'),
                ),
                title: Text('${usuario['nome']}'),
                subtitle: Text('${usuario['cargo']}'),
              );
            });
          }else if(snapshot.hasError){
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ));

  }

  getCliente() async{
    var url = Uri.parse('$BASE_URL/users');
    http.Response response = await http.get(url);
    if(response.statusCode==200){
      return jsonDecode(response.body);
      // dataUser= jsonDecode(response.body);
      // user=dataUser['users'];
    }else{
      throw Exception('Nao foi possivel carregar Usuarios');
    }
  }

}
