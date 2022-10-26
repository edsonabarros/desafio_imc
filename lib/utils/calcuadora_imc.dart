class CalculadoraImc {
  static String? calculoImc(peso, altura) {
    var imc = (peso / (altura * altura));

    if (imc < 16) {
      return "Magreza Grave";
    } else if (imc >= 16 && imc < 17) {
      return "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      return "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      return "Saudável";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II (Severa)";
    } else {
      return "Obesidade Grau III (Mórbida)";
    }
  }
}
