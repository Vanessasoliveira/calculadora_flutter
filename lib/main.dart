import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de média",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CalculaMedia(),
    );
  }
}

class CalculaMedia extends StatefulWidget {
  @override
  State createState() => _CalculaMediaState();
}

class _CalculaMediaState extends State<CalculaMedia> {
  String texto = "";
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  TextEditingController n3 = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Média'),
          backgroundColor: Colors.pink,

        ),
        body: Container(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'CALCULADORA DE MÉDIA',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: nome,
                    autofocus: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_box_rounded),
                      hintText: 'NOME',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'E-MAIL',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: n1,
                          decoration: InputDecoration(
                            hintText: 'Nota 1',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      Flexible(
                        child: TextField(
                          controller: n2,
                          decoration: InputDecoration(
                            hintText: 'Nota 2',
                            labelStyle: Theme.of(context).textTheme.headline6,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      Flexible(
                        child: TextField(
                          controller: n3,
                          decoration: InputDecoration(
                            hintText: 'Nota 3',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ])),
                Container(

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                  new SizedBox(
                  width: double.infinity,
                        child: new ElevatedButton(
                          child: Text(
                            'CALCULAR MÉDIA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          onPressed: () {
                            setState(() {
                              texto = calcula();
                            });
                          },
                        ),
                  ),
                        Text( texto, style: TextStyle (fontWeight: FontWeight.bold, color: Colors.pink)),
                        Container(
                          padding: EdgeInsets.only(right: 6),
                        ),
                  new SizedBox(
                      width: double.infinity,
                      child: new ElevatedButton(
                                 child: Text(
                                'APAGAR OS CAMPOS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              //color: Colors.pink,
                              onPressed: () {
                                nome.text = "";
                                email.text = "";
                                n1.text = "";
                                n2.text = "";
                                n3.text = "";
                                setState(() {
                                  texto = "";
                                });
                              },
                            ),
                        ),

                      ]),
                ),
              ],
            )));
  }

  String calcula() {
    double nota1 = double.parse(n1.text);
    double nota2 = double.parse(n2.text);
    double nota3 = double.parse(n3.text);

    double media = (nota1 + nota2 + nota3) / 3;


    String saida = ("Resultado:\n Nome: " + nome.text +
        "\n E-mail: " + email.text +
                "\n1ª Nota: " +
        n1.text +
        "\n2ª Nota: " +
        n2.text +
        "\n3ª Nota: " +
        n3.text +
        "\n Média: " +
        media.toStringAsFixed(2));

    return saida;
  }
}
