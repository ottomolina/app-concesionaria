import 'package:flutter/material.dart';

class CardComponent {
  Widget buildCard(String header, Icon icono, String titulo, String subtitulo,
      [String trailing]) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                header,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: icono,
                title: Text(titulo),
                subtitle: Text(subtitulo),
                trailing: Text(trailing ?? ''),
              ),
            ],
          ),
        ));
  }
}
