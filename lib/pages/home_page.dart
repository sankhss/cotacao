import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _realValueController = TextEditingController();
  final _dolarValueController = TextEditingController();
  final _realFocusNode = FocusNode();
  final _dolarFocusNode = FocusNode();

  var resultMessage;

  @override
  void dispose() {
    _realValueController.dispose();
    _dolarValueController.dispose();
    _realFocusNode.dispose();
    _dolarFocusNode.dispose();

    super.dispose();
  }

  void _calcular() {
    final real = double.tryParse(_realValueController.text.replaceAll(',', '.')) ?? 0.0;
    final dolar = double.tryParse(_dolarValueController.text.replaceAll(',', '.')) ?? 0.0;
    if (real > 0 && dolar > 0) {
      setState(() {
        showResult(real: real, dolar: dolar);
      });
    }
  }

  void showResult({double real, double dolar}) {
    final result = real / dolar;
    resultMessage =
        "Com R\$${real.toStringAsFixed(2).replaceAll('.', ',')} é possível comprar U\$${result.toStringAsFixed(2).replaceAll('.', ',')}!";
  }

  void _clear() {
    setState(() {
      _realValueController.clear();
      _dolarValueController.clear();
      resultMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorLight,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              _createImageLogo(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: _createForm(context),
              ),
              SizedBox(height: 20.0),
              if (resultMessage != null) _createResultMessage(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _createResultMessage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).accentColor),
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          resultMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }

  Form _createForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            controller: _realValueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            focusNode: _realFocusNode,
            onEditingComplete: () => FocusScope.of(context).requestFocus(_dolarFocusNode),
            decoration: InputDecoration(
              labelText: 'Quantidade em reais',
              hintText: '0,00',
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: _dolarValueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            focusNode: _dolarFocusNode,
            onEditingComplete: () {},
            decoration: InputDecoration(
              labelText: 'Cotação do dólar',
              hintText: '0,00',
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _calcular,
                child: Text(
                  'Calcular',
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: _clear,
                child: Text(
                  'Limpar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Center _createImageLogo() {
    return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset(
          'assets/images/dolar.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
