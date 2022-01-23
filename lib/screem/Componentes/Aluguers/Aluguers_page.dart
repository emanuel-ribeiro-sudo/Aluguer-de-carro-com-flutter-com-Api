import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../constants.dart';
import 'Aluguers_detail.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Aluguers_page extends StatefulWidget {

  @override
  State<Aluguers_page> createState() => _Aluguers_pageState();
}

class _Aluguers_pageState extends State<Aluguers_page>{
  var biCliente='';
  late Map data;
  List aluguer=[];

  getCars(String cliente) async{
    var url = Uri.parse('$BASE_URL/users/${cliente}/alguers');
    http.Response response = await http.get(url);
    print(response.body);
    if(response.statusCode==200){
      setState(() {
        aluguer = jsonDecode(response.body);
      });
    }
  }
  @override
  void initState() {
    setState(() {
      SharedPreferences.getInstance().then((value) =>{
        biCliente= value.getString('bi').toString(),
        getCars(biCliente),
      });
    });
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('bi' + biCliente);
        print('Aluguers' + aluguer.length.toString());
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAF8),
        body:ListView.builder(
                  itemCount: aluguer==null? 0 : aluguer.length,
            itemBuilder: (BuildContext context, int index) {
                 if(aluguer.isEmpty){
                   return Text("Nenhum Aluguer Encontrado",
                         style: const TextStyle(
                             color: bgColor,
                             fontFamily: 'Varela',
                             fontSize: 29.0),
                   );
                 }else {
                   return _buildCard("${aluguer[index]["matricula"]}",
                       'assets/aluguer.png',
                       '${aluguer[index]["estado"]}"',
                       "${aluguer[index]["data_inicio"]}",
                       "${aluguer[index]["preco_total"]}",
                       "${aluguer[index]["tempo"]}",context);
                 }

  }),
      ));
  }

  Widget _buildCard(String matricula,String imgPath, String estado,String dataInicio,String preco,String tempo, context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Aluguers_Details(
                    assetPath: imgPath,
                    matricula: matricula,
                    datainicio: dataInicio,
                    preco: preco,
                    tempo: tempo,
                    estado: estado,
                  ))
              );
            }
            ,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      ),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: Heroheight,
                          width: Herowidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 7.0),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text(matricula,
                          style: const TextStyle(
                              color: bgColor,
                              fontFamily: 'Varela',
                              fontSize: 16.0)
                          ),
                          ])
                  ),
                  Padding(padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    child:Text(estado.compareTo('true')!=1?'Desativo':'Ativo',
                        style:TextStyle(
                            color: estado.compareTo('true')!=1? Colors.red :Colors.green,
                            fontFamily: 'Varela',
                            fontSize: 20.0)
                    ),
                  )

                ]))));
  }
}
