import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveweatherbloc/bloc/weather_bloc.dart';
import 'package:liveweatherbloc/widgets/weather_info_card.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? city;
    var searchController = TextEditingController();

    return BlocProvider<WeatherBloc>(
      create: (context) =>
          WeatherBloc(InitialWeatherState())..add(InitialWeatherEvent()),
      child:
          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, blocState) {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              onChanged: (value) {
                city = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter city name';
                }
                return null;
              },
              controller: searchController,
              decoration: const InputDecoration(hintText: "Enter city name"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    if ((city != null) && (city != "")) {
                      context
                          .read<WeatherBloc>()
                          .add(SearchWeatherEvent(city: "$city"));
                    }
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
                child: blocState is InitialWeatherState
                    ? const CircularProgressIndicator()
                    : blocState is LoadingWeatherState
                        ? const CircularProgressIndicator(
                            color: Colors.red,
                          )
                        //when weather data is loaded/ready to display
                        : blocState is LoadedWeatherState
                            ? DisplayWeather(mausam: blocState.weatherData)
                            : (blocState is WeatherNotLoadedState)
                                ? const Text("Check connection")
                                : null),
          ),
        );
      }),
    );
  }
}
