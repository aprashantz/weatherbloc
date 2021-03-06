part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class SearchWeatherEvent extends WeatherEvent {
  final String city;
  const SearchWeatherEvent({required this.city});

  @override
  List<Object> get props => [city];
}

class InitialWeatherEvent extends WeatherEvent {}
