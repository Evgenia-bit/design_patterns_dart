
/// Класс фасада, который скрывает сложность подсистемы.
class HomeTheaterFacade {
  final Amplifier _amplifier;
  final Tuner _tuner;
  final DvdPlayer _dvdPlayer;
  final CdPlayer _cdPlayer;

  HomeTheaterFacade(this._amplifier, this._tuner, this._dvdPlayer, this._cdPlayer);

  void watchMovie(String movie) {
    print('Get ready to watch a movie...');
    _amplifier.on();
    _amplifier.setDvd(_dvdPlayer);
    _amplifier.setSurroundSound();
    _amplifier.setVolume(5);
    _dvdPlayer.on();
    _dvdPlayer.play(movie);
  }

  void endMovie() {
    print('Shutting movie theater down...');
    _amplifier.off();
    _dvdPlayer.stop();
    _dvdPlayer.eject();
    _dvdPlayer.off();
  }

  void listenToCd(String cdTitle) {
    print('Get ready for an audiopile experence...');
    _amplifier.on();
    _amplifier.setVolume(5);
    _amplifier.setCd(_cdPlayer);
    _amplifier.setStereoSound();
    _cdPlayer.on();
    _cdPlayer.play(cdTitle);
  }

  void endCd() {
    print('Shutting down CD...');
    _amplifier.off();
    _amplifier.setCd(_cdPlayer);
    _cdPlayer.eject();
    _cdPlayer.off();
  }

  void listenToRadio(double frequency) {
    print('Tuning in the airwaves...');
    _tuner.on();
    _tuner.setFrequency(frequency);
    _amplifier.on();
    _amplifier.setVolume(5);
}
}

/// Класс усилителя.
class Amplifier {
  void on() {
    print('Amplifier is on');
  }

  void off() {
    print('Amplifier is off');
  }

  void setStereoSound() {
    print('Stereo sound is set');
  }

  void setSurroundSound() {
    print('Surround sound is set');
  }

  void setVolume(int volume) {
    print('Volume is set to $volume');
  }

  void setCd(CdPlayer cdPlayer) {
    print('CD is set');
  }

  void setDvd(DvdPlayer dvdPlayer) {
    print('DVD is set');
  }
}

/// Класс тюнера.
class Tuner {
  void on() {
    print('Tuner is on');
  }

  void off() {
    print('Tuner is off');
  }

  void setAm() {
    print('AM is set');
  }

  void setFm() {
    print('FM is set');
  }

  void setFrequency(double frequency) {
    print('Frequency is set to $frequency');
  }
}

/// Класс DVD-плеера.
class DvdPlayer {
  void on() {
    print('DVD player is on');
  }

  void off() {
    print('DVD player is off');
  }

  void play(String movie) {
    print('Playing $movie');
  }

  void stop() {
    print('DVD player is stopped');
  }

  void eject() {
    print('DVD player is ejected');
  }
}

/// Класс CD-плеера.
class CdPlayer {
  void on() {
    print('CD player is on');
  }

  void off() {
    print('CD player is off');
  }

  void play(String cdTitle) {
    print('Playing $cdTitle');
  }

  void stop() {
    print('CD player is stopped');
  }

  void eject() {
    print('CD player is ejected');
  }
}