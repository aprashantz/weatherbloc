import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:liveweatherbloc/apis/Weather.dart';
import 'package:liveweatherbloc/apis/get_weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherBloc(InitialWeatherState initialWeatherState)
      : super(InitialWeatherState());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is InitialWeatherEvent) {
      yield LoadingWeatherState();
      try {
        Weather? cWeather = await Fetch.getWeather(place: "auto:ip");
        yield LoadedWeatherState(cWeather);
        print("initial done");
      } catch (e) {
        yield WeatherNotLoadedState();
      }
    }

    if (event is SearchWeatherEvent) {
      yield LoadingWeatherState();
      try {
        Weather? cWeather = await Fetch.getWeather(place: event.city);
        yield LoadedWeatherState(cWeather);
        print("done");
      } catch (e) {
        yield WeatherNotLoadedState();
      }
    }
  }
}
