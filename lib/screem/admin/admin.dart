import 'package:flutter/material.dart';
import 'package:rent_car/screem/Componentes/Automoveis/automoveis_page.dart';
import 'package:rent_car/screem/Componentes/Empresas/empresa_page.dart';

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
          Automoveis_page()
        ],

      ),
      ),
    );
  }
}
