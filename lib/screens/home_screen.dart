import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var valor1;

  var valor2;

  var valorFinal = 0;

  var operacion;

  var booleanOperacion = false;

  bool primerValor = true;

  bool booleanFinal = false;

  var finalCadena = "";

  bool booleanpositivo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: SizedBox(
              height: 40,
              //width: 2000,
            ),
          ),
          Container(
            child: SizedBox(
              height: 100,
              width: 2000,
              child: Text(
                "$finalCadena",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 50,
                ),
                textScaleFactor: 1.3,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              //height: 50.0,
              //width: 500.0,
              child: GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Text("%"),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Text("CE"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      reseteaCadena();
                      reseteaValores();
                      setState(() {});
                    },
                    child: const Text("C"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      borraDigito();
                      setState(() {});
                    },
                    child: const Text("<-"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(6);
                      insertaValor();
                      calculaResultado();
                      setState(() {});
                      reseteaCadena();
                    },
                    child: const Text("^(-1)"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(4);
                      insertaValor();
                      calculaResultado();
                      setState(() {});
                      reseteaCadena();
                    },
                    child: const Text("^2"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(5);
                      insertaValor();
                      calculaResultado();
                      setState(() {});
                      reseteaCadena();
                    },
                    child: const Text("Sqrt"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(3);
                      insertaValor();
                      reseteaCadena();
                    },
                    child: const Text("/"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("7");
                      setState(() {});
                    },
                    child: const Text("7"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("8");
                      setState(() {});
                    },
                    child: const Text("8"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("9");
                      setState(() {});
                    },
                    child: const Text("9"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(2);
                      insertaValor();
                      reseteaCadena();
                    },
                    child: const Text("x"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("4");
                      setState(() {});
                    },
                    child: const Text("4"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("5");
                      setState(() {});
                    },
                    child: const Text("5"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("6");
                      setState(() {});
                    },
                    child: const Text("6"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(1);
                      insertaValor();
                      reseteaCadena();
                    },
                    child: const Text("-"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("1");
                      setState(() {});
                    },
                    child: const Text("1"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("2");
                      setState(() {});
                    },
                    child: const Text("2"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("3");
                      setState(() {});
                    },
                    child: const Text("3"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setOperacion(0);
                      insertaValor();
                      print(valor1);
                      print(valor2);
                      reseteaCadena();
                    },
                    child: const Text("+"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaSigno();
                      setState(() {});
                    },
                    child: const Text("+/-"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto("0");
                      setState(() {});
                    },
                    child: const Text("0"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cambiaTexto(".");
                      setState(() {});
                    },
                    child: const Text("."),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      insertaValor();
                      calculaResultado();
                      setState(() {});
                      reseteaCadena();
                    },
                    child: const Text("="),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void cambiaTexto(String numero) {
    if (primerValor && booleanFinal) {
      finalCadena = "";
      booleanFinal = false;
    }
    finalCadena += numero;
  }

  void insertaValor() {
    if (primerValor) {
      if (finalCadena.contains('.')) {
        valor1 = int.parse(finalCadena);
      } else {
        valor1 = double.parse(finalCadena);
      }
    } else {
      if (finalCadena.contains('.')) {
        valor2 = int.parse(finalCadena);
      } else {
        valor2 = double.parse(finalCadena);
      }
    }
    print(primerValor);
    print(valor1);
    print(valor2);
  }

  void calculaResultado() {
    //if (!booleanFinal && booleanOperacion) {
    switch (operacion) {
      case 0:
        {
          finalCadena = (valor1 + valor2).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
          print(finalCadena);
        }

        break;
      case 1:
        {
          finalCadena = (valor1 - valor2).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
        }

        break;
      case 2:
        {
          finalCadena = (valor1 * valor2).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
        }

        break;
      case 3:
        {
          finalCadena = (valor1 / valor2).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
        }

        break;

      case 4:
        {
          finalCadena = (valor1 * valor1).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
        }
        break;

      case 5:
        {
          finalCadena = pow(valor1, 0.5).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
        }
        break;

      case 6:
        {
          finalCadena = pow(valor1, -1).toString();
          booleanFinal = true;
          primerValor = true;
          reseteaValores();
        }
        break;
        print(finalCadena);
    }
    //}
  }

  void setOperacion(int numero) {
    operacion = numero;
    primerValor = false;
    booleanOperacion = true;
  }

  void reseteaValores() {
    valor1 = null;
    valor2 = null;
    primerValor = true;
    booleanFinal = false;
  }

  void reseteaCadena() {
    finalCadena = "";
  }

  void cambiaSigno() {
    if (booleanpositivo) {
      finalCadena = "-" + finalCadena;
      booleanpositivo = false;
    } else {
      finalCadena = finalCadena.substring(1);
      booleanpositivo = true;
    }
  }

  void borraDigito() {
    finalCadena = finalCadena.substring(0, finalCadena.length - 1);
  }
}
