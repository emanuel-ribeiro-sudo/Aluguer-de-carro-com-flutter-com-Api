import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import 'automoveis_detail.dart';

class Automoveis_page extends StatefulWidget {


  @override
  State<Automoveis_page> createState() => _Automoveis_pageState();
}

class _Automoveis_pageState extends State<Automoveis_page> {
  late Map data;
  List automovelData = [];
  getCars() async{
    var url = Uri.parse('$BASE_URL/automoveis');
    http.Response response = await http.get(url);
    debugPrint(response.body);
    data = jsonDecode(response.body);
    setState(() {
      automovelData=data['automoveis'];
    });

  }
  @override
  void initState(){
    super.initState();
    getCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView.builder(
        itemCount: automovelData==null? 0 : automovelData.length,
        itemBuilder: (BuildContext context, int index) {
         // const SizedBox(height: 15.0),
         //  if("${automovelData[index]["estado"]}"=='Ocupado'){
         //    return CircularProgressIndicator();
         //  }else {
            return _buildCard(
                "${automovelData[index]["matricula"]}",
                "${automovelData[index]["preco_diario"]}",
                'assets/automoveis/${index + 2}.jpg',
                "${automovelData[index]["marca"]}",
                "${automovelData[index]["cor"]}",
                "${automovelData[index]["estado"]}",
                context);
          // }
          //   Container(
          // padding: const EdgeInsets.only(right: 15.0),
          // width: MediaQuery.of(context).size.width - 30.0,
          // height: MediaQuery.of(context).size.height - 50.0,
          // child: GridView.count(
          // crossAxisCount: 2,
          // primary: false,
          // crossAxisSpacing: 10.0,
          // mainAxisSpacing: 15.0,
          // childAspectRatio: 0.8,
          // children: <Widget>[
          // _buildCard("${automovelData[index]["matricula"]}", "${automovelData[index]["preco_diario"]}", 'assets/automoveis/2.jpg', context),
          // ],
          // )
          // );
         // const SizedBox(height: 15.0,),
        },
        //children: <Widget>[
          // const SizedBox(height: 15.0),
          // Container(
          //     padding: const EdgeInsets.only(right: 15.0),
          //     width: MediaQuery.of(context).size.width - 30.0,
          //     height: MediaQuery.of(context).size.height - 50.0,
          //     child: GridView.count(
          //       crossAxisCount: 2,
          //       primary: false,
          //       crossAxisSpacing: 10.0,
          //       mainAxisSpacing: 15.0,
          //       childAspectRatio: 0.8,
          //       children: <Widget>[
          //         _buildCard('Cookie mint', '\$3.99', 'assets/automoveis/2.jpg', context),
          //         _buildCard('Cookie cream', '\$5.99', 'assets/automoveis/3.jpg', context),
          //         _buildCard('Cookie classic', '\$1.99','assets/automoveis/4.jpg',  context),
          //         _buildCard('Cookie choco', '\$2.99', 'assets/automoveis/7.jpg',context),
          //
          //       ],
          //     )),
          // const SizedBox(height: 15.0,),
        //],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: const Icon(Icons.add),
        )
    );
  }

  Widget _buildCard(String matricula, String preco, String imgPath,String marca,String cor, String estado,context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Automoveis_Details(
                    assetPath: imgPath,
                    carroPreco:preco,
                    carroMatricula: matricula,
                    carromarca: marca,
                    carrocor: cor,
                    carroestado: estado,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                                 Icon(Icons.remove_circle, color: remColor)
                          ])),
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
                  Text(matricula,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 16.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text(preco,
                          style: const TextStyle(
                              color: bgColor,
                              fontFamily: 'Varela',
                              fontSize: 16.0)),
                                const Icon(Icons.edit,
                                color: bgColor, size: 24.0),
                            // if (added) ...[
                            //   Icon(Icons.remove_circle_outline,
                            //       color: Color(0xFFD17E50), size: 12.0),
                            //   Text('3',
                            //       style: TextStyle(
                            //           fontFamily: 'Varela',
                            //           color: Color(0xFFD17E50),
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 12.0)),
                            //   Icon(Icons.add_circle_outline,
                            //       color: Color(0xFFD17E50), size: 12.0),
                            // ]
                          ])
                  )

                ]))));
  }


}


