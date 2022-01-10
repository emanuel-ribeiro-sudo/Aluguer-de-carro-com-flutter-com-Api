import 'package:flutter/material.dart';
import 'package:rent_car/screem/Componentes/Aluguers/Aluguers_page.dart';
import 'package:rent_car/screem/Componentes/Automoveis/automoveis_page.dart';
import 'package:rent_car/screem/Componentes/Empresas/empresa_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
class Clientes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Clientes",
            style: TextStyle(fontWeight:FontWeight.bold),),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor:Colors.white ,
            tabs: [
              Tab(child: Text("Empresas")),
              Tab(child: Text("Automoveis")),
              Tab(child: Text("Meus Aluguers")),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () async{
                  bool saiu = await sair();
                  if(saiu){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>MyHomePage()));
                  }
                },
                icon: Icon(Icons.logout)),
            // IconButton(
            //     onPressed: (){},
            //     icon: Icon(Icons.more_vert))
          ],
        ),
        body: TabBarView(
          children: [
            Empresa_page(),
            Automoveis_page(),
            Aluguers_page()
          ]),
        ),
    );
  }
  Future <bool> sair() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
}