import 'dart:convert';
import 'package:desafio_imc/utils/consoles_utils.dart';
import 'package:desafio_imc/exceptions/nome_invalido_exception.dart';
import 'dart:io';

void main(List<String> arguments) {
  print("Olá! Bem-vindo ao sistema de IMC! ");
  String nome = ConsoleUtils.lerStringComTexto(
      "Para começar, digite o nome do paciente: ");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);

    exit(0);
  }

  double pesoConvertido = 0.0;
  double alturaConvertida = 0.0;
  String? peso;
  String? altura;
  final rgxNumeral = RegExp(r'^-?:\.|[0-9]+$');
  bool regex = false;

  do {
    print("Informar peso: ");
    peso = stdin.readLineSync(encoding: utf8);
    if (peso != null && rgxNumeral.hasMatch(peso)) {
      pesoConvertido = double.parse(peso);
      regex = true;
    } else {
      print("Informe um valor válido! ");
      regex = false;
    }
  } while (peso == null || regex == false);

  do {
    print("Informar altura: ");
    altura = stdin.readLineSync(encoding: utf8);
    if (altura != null && rgxNumeral.hasMatch(altura)) {
      alturaConvertida = double.parse(altura);
      regex = true;
    } else {
      print("Informe um valor válido! ");
      regex = false;
    }
  } while (altura == null || regex == false);

  double imc = pesoConvertido / (alturaConvertida * alturaConvertida);

  if (imc < 16) {
    print("O paciente: $nome possui Magreza Grave - Valor do IMC: $imc");
  } else if (imc >= 16 && imc < 17) {
    print("O paciente: $nome possui Magreza moderada - Valor do IMC: $imc");
  } else if (imc >= 17 && imc < 18.5) {
    print("O paciente: $nome possui Magreza leve - Valor do IMC: $imc");
  } else if (imc >= 18.5 && imc < 25) {
    print("O paciente: $nome é Saudável - Valor do IMC: $imc");
  } else if (imc >= 25 && imc < 30) {
    print("O paciente: $nome possui Sobrepeso - Valor do IMC: $imc");
  } else if (imc >= 30 && imc < 35) {
    print("O paciente: $nome possui Obesidade Grau I - Valor do IMC: $imc");
  } else if (imc >= 35 && imc < 40) {
    print(
        "O paciente: $nome possui Obesidade Grau II (Severa) - Valor do IMC: $imc");
  } else {
    print(
        "O paciente: $nome possui Obesidade Grau III (Mórbida) - Valor do IMC: $imc");
  }
}
