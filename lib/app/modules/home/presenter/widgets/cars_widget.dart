import 'package:flutter/material.dart';

class CarsWidget extends StatelessWidget {
  final int ano;
  final String nomeModelo;
  final int numeroPortas;
  final String cor;
  final double valor;
  final String combustivel;

  const CarsWidget(
      {super.key,
      required this.ano,
      required this.nomeModelo,
      required this.numeroPortas,
      required this.cor,
      required this.valor,
      required this.combustivel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nomeModelo),
              Text('$ano'),
              Text('numero de portas: $numeroPortas'),
              Text('cor: $cor'),
              Text('valor: $valor'),
              Text('combustivel: $combustivel')
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.amber),
              child: Center(
                  child: Text(
                'Eu Quero',
                style: TextStyle(color: Colors.black),
              )),
            ),
          )
        ],
      ),
    );
  }
}
