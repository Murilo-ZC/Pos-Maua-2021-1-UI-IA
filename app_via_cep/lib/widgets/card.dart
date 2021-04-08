import 'package:flutter/material.dart';

class NossoCard extends StatelessWidget {
  final viacep;

  const NossoCard(this.viacep);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text("CEP:${viacep.cep}"),
        title: Text("Logradouro: ${viacep.logradouro}"),
        subtitle: Text("Localidade: ${viacep.localidade}"),
      ),
    );
  }
}
