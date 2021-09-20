part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final weatherData;
  LoadedWeatherState(this.weatherData);
  @override
  List<Object?> get props => [weatherData];
}

class WeatherNotLoadedState extends WeatherState {}
