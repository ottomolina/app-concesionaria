import 'package:app_concesionario/src/components/input_component.dart';
import 'package:flutter/material.dart';

class FormClientePage extends StatefulWidget {
  static final pageName = 'formCliente';
  FormClientePage({Key key}) : super(key: key);

  @override
  _FormClientePageState createState() => _FormClientePageState();
}

class _FormClientePageState extends State<FormClientePage> {
  final formKey = GlobalKey<FormState>();
  List<String> _generos = ['Hombre', 'Mujer'];
  String _seleccionado = 'Hombre';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Clientes'),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: _guardarCliente)
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  InputComponent().crearInputText(
                      'Nombres:', 'Ingrese al menos un nombre.'),
                  InputComponent().crearInputText(
                      'Apellidos:', 'Ingrese al menos un apellido'),
                  InputComponent().crearInputPhone(
                      'Teléfono:', 'Ingrese un número de teléfono'),
                  InputComponent()
                      .crearInputText('Correo:', 'Ingrese un correo'),
                  InputComponent()
                      .crearInputText('Dirección:', 'Ingrese una dirección'),
                  InputComponent().crearInputText('Nacimiento:'),
                  _crearDropdown('Género'),
                  InputComponent()
                      .crearInputText('Ocupación:', 'Ingrese una ocupación'),
                  InputComponent().crearInputNumber(
                      'Ingresos:', 'Debe ingresar solo valores numéricos'),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _crearDropdown(String label) {
    List<DropdownMenuItem<String>> opciones = [];
    _generos.forEach((element) {
      opciones
          .add(DropdownMenuItem<String>(child: Text(element), value: element));
    });

    return Row(
      children: <Widget>[
        Expanded(
          child: DropdownButton(
              value: _seleccionado,
              items: opciones,
              onChanged: (opt) {
                setState(() {
                  _seleccionado = opt;
                });
              }),
        ),
      ],
    );
  }

  void _guardarCliente() {
    formKey.currentState.validate();
  }
}
