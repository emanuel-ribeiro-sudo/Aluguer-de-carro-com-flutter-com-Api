import 'package:flutter/material.dart';
import 'package:rent_car/screem/Componentes/Aluguers/Aluguers_page.dart';
import 'package:rent_car/screem/Componentes/Automoveis/automoveis_page.dart';
import 'package:rent_car/screem/Componentes/Funcionarios/funcionarios_page.dart';

import '../../constants.dart';
class Principal_empresa extends StatelessWidget {
  const Principal_empresa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nome de Empresa",
          style: TextStyle(fontWeight:FontWeight.bold),),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor:Colors.white ,
            tabs: [
              Tab(child: Text("Funcionarios")),
              Tab(child: Text("Automoveis")),
              Tab(child: Text("Alugures"))
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
      body:TabBarView(
        children: [
          Funcionarios_page(),
          Automoveis_page(),
          Aluguers_page()
        ],
      ),

      ),
    );
  }
}
