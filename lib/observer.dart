abstract interface class Subject {
  void registerObserver(Observer o);
  void removeObserver(Observer o);
  void notifyObservers();
}

abstract interface class Observer {
  void update();
}

class WeatherData implements Subject {
  final List<Observer> _observers = [];

  double _temperature = 0;
  double get temperature => _temperature;

  double _humidity = 0;
  double get humidity => _humidity;

  double _pressure = 0;
  double get pressure => _pressure;

  WeatherData();

  @override
  void registerObserver(Observer o) {
    _observers.add(o);
  }

  @override
  void removeObserver(Observer o) {
    _observers.remove(o);
  }

  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update();
    }
  }

  void measurementsChanged() {
    notifyObservers();
  }

  void setMeasurements(double temperature, double humidity, double pressure) {
    _temperature = temperature;
    _humidity = humidity;
    _pressure = pressure;
    measurementsChanged();
  }
}

abstract interface class DisplayElement {
  void display();
}

class CurrentConditionsDisplay implements Observer, DisplayElement {
  final WeatherData _weatherData;
  late double _temperature;
  late double _humidity;

  CurrentConditionsDisplay(this._weatherData) {
    _weatherData.registerObserver(this);
    _temperature = _weatherData.temperature;
    _humidity = _weatherData.humidity;
  }

  @override
  void update() {
    _temperature = _weatherData.temperature;
    _humidity = _weatherData.humidity;

    display();
  }

  @override
  void display() {
    print('Current conditions: $_temperature F degrees and $_humidity% humidity');
  }
}
