import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/model/weahter.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/util/constants.dart';
import 'package:weather_app/widget/aspect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repo = WeatherRepository();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _repo.getCurrentWeather("moscow");
      },
      child: FutureBuilder(
        future: _repo.getCurrentWeather('moscow'),
        builder: (context, state) {
          if(state.data != null) {
            return _successField(state.data);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  _successField(WeatherResponse? response) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200,
              Colors.green,
            ],
            begin: Alignment.topCenter
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(Constants.iconUrl(response?.weather?[0].icon ?? "")),
                Text(
                  Constants.currentDate(),
                  style: const TextStyle(fontSize: 20,color: Colors.white),
                ),
                Text(
                  "${Constants.kelvinToCelsius(response?.main?.temp)}°",
                  style: const TextStyle(fontSize: 100,color: Colors.white),
                ),
                Text(response?.name ?? "",style: const TextStyle(fontSize: 30,color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Aspect(icon: CupertinoIcons.thermometer, data: (response?.main?.pressure ?? "").toString()),
                    Container(
                      width: 2,
                      height: 45,
                      color: CupertinoColors.systemGrey,
                    ),
                    Aspect(icon: CupertinoIcons.drop, data: (response?.main?.humidity ?? "").toString()),
                    Container(
                      width: 2,
                      height: 45,
                      color: CupertinoColors.systemGrey,
                    ),
                    Aspect(icon: CupertinoIcons.wind, data: (response?.wind?.speed ?? "").toString()),
                  ],
                ),
                const Gap(40),
                SegmentedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(CupertinoColors.white)
                  ),
                    segments: [
                  ButtonSegment(value: true,label: Text("Hourly")),
                  ButtonSegment(value: true,label: Text("Daily")),
                ], selected: {"true"})
              ],
            ),
          ),
        ),
      )
    );
  }
}
