class TemperatureModel{
  TemperatureModel(this.celcius);
  final double celcius;

  // konversi celcius ke celcius
  double getCelcius(){
    return celcius;
  }

  // konversi celcius ke kelvin
  double getKelvin(){
    return celcius + 273;
  }

  // konversi celcius ke reamur
  double getReamur(){
    return (4/5) * celcius;
  }

  // konversi celcius ke fahrentheit
  double getFahrentheit(){
    return (9/5 * celcius) + 32;
  }
}