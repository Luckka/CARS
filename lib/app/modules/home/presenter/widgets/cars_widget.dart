import 'package:flutter/material.dart';

class CarsWidget extends StatelessWidget {

  final int ano;
  final String nomeModelo;
  final int numeroPortas;
  final String cor;
  final double valor;
  final String combustivel;

  const CarsWidget({super.key, required this.ano, required this.nomeModelo, required this.numeroPortas, required this.cor, required this.valor, required this.combustivel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$ano'),
        Text(nomeModelo),
        Text('numero de portas: $numeroPortas'),
        Text('cor: $cor'),
        Text('valor: $valor'),
        Text('combustivel: $combustivel')

      ],

    );
  }
}