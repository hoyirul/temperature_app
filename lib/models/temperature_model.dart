class TemperatureModel{
  TemperatureModel(this.celcius);
  final double celcius;

  double getTemperature(String choose){
    double result = 0;
    if(choose == 'Kelvin'){
      result = getKelvin();
    }else if(choose == 'Reamur'){
      result = getReamur();
    }else if(choose == 'Fahrentheit'){
      result = getFahrentheit();
    }else{
      result = 0;
    }

    return result;
  }

  // konversi celcius ke celcius
  double getCelcius(){
    return celcius.ceilToDouble();
  }

  // konversi celcius ke kelvin
  double getKelvin(){
    return (celcius + 273).ceilToDouble();
  }

  // konversi celcius ke reamur
  double getReamur(){
    return ((4/5) * celcius).ceilToDouble();
  }

  // konversi celcius ke fahrentheit
  double getFahrentheit(){
    return ((9/5 * celcius) + 32).ceilToDouble();
  }
}