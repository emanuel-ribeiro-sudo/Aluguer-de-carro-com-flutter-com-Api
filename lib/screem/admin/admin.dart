import 'package:flutter/material.dart';
import 'package:rent_car/main.dart';
import 'package:rent_car/screem/Componentes/Automoveis/automoveis_page.dart';
import 'package:rent_car/screem/Componentes/Clientes/clientes.dart';
import 'package:rent_car/screem/Componentes/Empresas/empresa_page.dart';
import 'package:rent_car/screem/cliente/clientes.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Renta car",
          style: TextStyle(fontWeight:FontWeight.bold),),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor:Colors.white ,
            tabs: [
              Tab(child: Text("Empresa")),
              Tab(child: Text("Automoveis")),
              Tab(child: Text("Clientes"))
            ],
          ),
          actions: [
            IconButton(
                onPressed: ()async{
                  bool saiu = await sair();
                  if(saiu){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>MyHomePage()));
                  }
                },
                icon: Icon(Icons.logout)),
          ],
        ),
      body: TabBarView(
        children: [
          Empresa_page(),
          Automoveis_page(),
          cliente_Page(),
        ],

      ),
      ),
    );
  }
  Future <bool> sair() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
}
