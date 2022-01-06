import 'package:flutter/material.dart';
import 'package:rent_car/screem/Componentes/Aluguers/Aluguers_page.dart';
import 'package:rent_car/screem/Componentes/Automoveis/automoveis_page.dart';
import 'package:rent_car/screem/Componentes/Empresas/empresa_page.dart';
class Clientes extends StatefulWidget {
  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
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
                onPressed: (){},
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_vert))
          ],
        ),
        body: const TabBarView(
          children: [
            Empresa_page(),
            Automoveis_page(),
            Aluguers_page()
          ]),
        ),
    );
  }
}