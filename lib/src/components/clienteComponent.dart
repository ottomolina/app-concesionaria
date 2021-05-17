import 'package:app_concesionario/src/models/clienteModel.dart';
import 'package:flutter/material.dart';

class ClienteComponent {
  ClienteComponent();

  Widget cargarClientes(Future<List<Cliente>> future,
      [String navToPage, Function onTapCliente]) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<List<Cliente>> snapshot) {
          if (snapshot.hasData) {
            final lista = snapshot.data;
            return Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Text(
                                  _getIniciales(lista[index]),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                            title: Text(
                                '${lista[index].nombres} ${lista[index].apellidos}'),
                            subtitle: Text(lista[index].correo),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () => {
                              if (navToPage != null)
                                {
                                  Navigator.pushNamed(context, navToPage,
                                      arguments: lista[index])
                                }
                              else
                                {onTapCliente(lista[index])}
                            },
                          ),
                          Divider()
                        ],
                      );
                    }));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  String _getIniciales(Cliente cliente) {
    String firstLetterNombre = cliente.nombres.substring(0, 1);
    String firstLetterApellido = cliente.apellidos.substring(0, 1);
    return '$firstLetterNombre$firstLetterApellido';
  }
}
