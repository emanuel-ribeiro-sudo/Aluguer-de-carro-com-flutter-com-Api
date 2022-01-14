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
  var biCliente='0006';
  late Map data;
  List aluguer=[];

  getCars(String cliente) async{
    var url = Uri.parse('$BASE_URL/users/${cliente}/alguers');
    http.Response response = await http.get(url);
    print(response.body);
    if(response.statusCode==200){
      aluguer = jsonDecode(response.body);
      setState(() {
        // aluguer=[data];
      });
    }
  }
  @override
  void initState() {
    setState(() {
      SharedPreferences.getInstance().then((value) =>{
        biCliente= value.getString('bi').toString(),
      });
    });
    getCars(biCliente);
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(biCliente);
      },
      child: Scaffold(
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
                    _buildCard("${biCliente}",'assets/empresa/logo1.png', context),
                    // _buildCard('Cookie cream','assets/empresa/logo1.png', context),
                    // _buildCard('Cookie classic','assets/empresa/logo1.png',  context),
                    // _buildCard('Cookie choco','assets/empresa/logo1.png',context),
                  ],
                )),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String matricula,String imgPath, context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Aluguers_Details(
                    assetPath: imgPath,
                    cookiename: matricula
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
                          Text(matricula,
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
