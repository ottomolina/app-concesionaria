import 'package:flutter/material.dart';

import 'package:app_concesionario/src/models/cotizacionModel.dart';
import 'package:app_concesionario/src/models/vehiculoModel.dart';

class VehiculoComponent {
  Widget cargarVehiculos(Future<List<Vehiculo>> future,
      [String navToPage, Function onTapVehiculo]) {
    return FutureBuilder(
        future: future,
        builder:
            (BuildContext context, AsyncSnapshot<List<Vehiculo>> snapshot) {
          if (snapshot.hasData) {
            final lista = snapshot.data;
            return Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      Vehiculo vehiculo = lista[index];
                      return listadoVehiculos(
                          context, vehiculo, null, onTapVehiculo);
                    }));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget listadoVehiculos(BuildContext context, Vehiculo vehiculo,
      [String navToPage, Function onTapVehiculo, Cotizacion cotizacion]) {
    return Column(
      children: [
        ListTile(
          title: Text('${vehiculo.marca} ${vehiculo.linea} ${vehiculo.modelo}'),
          subtitle: Text('${vehiculo.tipo} cc: ${vehiculo.cc} '),
          trailing: Text('${vehiculo.precio}'),
          onTap: () => {
            if (navToPage != null)
              {
                if (cotizacion != null)
                  {
                    Navigator.pushNamed(context, navToPage,
                        arguments: cotizacion)
                  }
                else
                  {Navigator.pushNamed(context, navToPage, arguments: vehiculo)}
              }
            else
              {onTapVehiculo(vehiculo)}
          },
        ),
        Divider()
      ],
    );
  }
}
