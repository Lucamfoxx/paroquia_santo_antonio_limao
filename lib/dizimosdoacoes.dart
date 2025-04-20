import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoacoesPage extends StatelessWidget {
  final String doacaoPix =
      "00020126360014BR.GOV.BCB.PIX0114630898250169035204000053039865802BR5922PAROQUIA SANTO ANTONIO6009SAO PAULO62070503***6304F155";
  final String dizimoPix =
      "00020126360014BR.GOV.BCB.PIX0114630898250169035204000053039865802BR5922PAROQUIA SANTO ANTONIO6009SAO PAULO62070503***6304F155";
  final String codigoPix =
      "00020126360014BR.GOV.BCB.PIX0114630898250169035204000053039865802BR5922PAROQUIA SANTO ANTONIO6009SAO PAULO62070503***6304F155";

  void _copiarCodigoPix(String codigoPix, BuildContext context) {
    Clipboard.setData(ClipboardData(text: codigoPix));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Código do Pix copiado para a área de transferência'),
    ));
  }

  void _mostrarAviso(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pix Copiado'),
          content: Text(
            '\n- Clique no botão de Fazer Doação ou Dizimo'
            '\n- O Pix já será copiado. '
            '\n- Abra o seu aplicativo de banco ou pagamentos'
            '\n- Procure a opção Pix.',
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazer Doação ou Dízimo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Text(
                '\n- Clique no botão de Fazer Doação ou Dízimo'
                '\n- O Pix já será copiado. '
                '\n- Abra o seu aplicativo de banco ou pagamentos'
                '\n- Procure a opção Pix.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  _copiarCodigoPix(doacaoPix, context);
                  _mostrarAviso(context);
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Fazer Doação',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  _copiarCodigoPix(dizimoPix, context);
                  _mostrarAviso(context);
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Fazer Dízimo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20.0),
              child: SelectableText(
                codigoPix,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
