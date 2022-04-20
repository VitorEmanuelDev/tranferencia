import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/Editor.dart';
import '../../../main.dart';
import '../../../models/Transferencia.dart';

const _tituloAppBar = 'Criando Transferencia';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '00000';

const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: Text(_tituloAppBar),
      ),
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on),
          ElevatedButton(
            child: const Text(_botaoConfirmar),
            onPressed: () => _criaTransferencia(context),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent[700],
            ),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
