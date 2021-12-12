import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rent_car/logics/clientes.dart';
import '../../../constants.dart';
import 'funcionarios_detail.dart';
import 'package:xml/xml.dart' as xml;

class Funcionarios_page extends StatelessWidget {

  Future<List<Cliente>?> getClienteFromXML(BuildContext context) async{
    String xmlString = await DefaultAssetBundle.of(context).loadString("assets/dados/Clientes.xml");
    var raw = xml.parse(xmlString);
    var elemets =raw.findAllElements("cliente");
    return elemets.map((element){
      return Cliente(int.parse(element.findElements("bi").first.text),element.findElements("nome").first.text, element.findElements("morada").first.text,
          int.parse(element.findElements("numero_carta").first.text), element.findElements("cargo").first.text, element.findElements("senha").first.text,
          element.findElements("telefone").first.text, element.findElements("utilizador").first.text);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.8,
                    children: <Widget>[
                      _buildCard('Func1', 'assets/funcionario/func1.png', context),

                    ],
                  )
          ),
          const SizedBox(height: 15.0),
        ],
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

  Widget _buildCard(String Nome, String imgPath, context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Funcionarios_Details(
                    assetPath: imgPath,
                    cookiename: Nome
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
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text(Nome,
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
