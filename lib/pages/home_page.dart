import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import '../utils/constanst.dart';
import '../model/weather_model.dart';
import '../services/weather_api_client.dart';
import '../widget/current_weather.dart';
import '../widget/more_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  WeatherApiClient weatherapi = WeatherApiClient();
  WeatherModel? data;
  //
  Future<void> getData(String? location) async {
    data = await weatherapi.getCurrentWeather(location);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: new BoxDecoration(
              color: Colors.black
          ),
          width: w,
          height: h,
          child: Container(margin: EdgeInsets.all(10), child: loadedData()),
        ),
      ),
    );
  }

  FutureBuilder<void> loadedData() {
    return FutureBuilder(
      // Zanjan , Toronto, Yakutsk, las vegas, miami
      future: getData("Minsk"),
      builder: (ctx, snp) {
        if (snp.connectionState == ConnectionState.done) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currentWeather(
                  onPressed: () {
                    setState(() {
                      loadedData();
                    });
                  },
                  temp: "${data!.temp}",
                  location: "${data!.cityName}",
                  status: "${data!.status}",
                  country: "${data!.country}"),
              moreInfo(
                  wind: "${data!.wind}",
                  humidity: "${data!.humidity}",
                  feelsLike: "${data!.feelsLike}")
            ],
          );
        } else if (snp.connectionState == ConnectionState.waiting) {
          return Center(
            child: CupertinoActivityIndicator(
              radius: 20,
              color: Colors.blueAccent,
            ),
          );
        }
        return Container();
      },
    );
  }
}
