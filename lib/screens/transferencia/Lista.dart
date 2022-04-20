import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/Transferencia.dart';
import 'Formulario.dart';

const _tituloAppBar = 'Transferencias';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias =
      List<Transferencia>.empty(growable: true);
  //final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //final Future<Transferencia?> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })). /*future*/ then(
              (transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    //  Future.delayed(Duration(seconds: 1), () {
    //if (transferenciaRecebida != null) {
    setState(() {
      widget._transferencias.add(transferenciaRecebida!);
    });
    //  }
    //  });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}
