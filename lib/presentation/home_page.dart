import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_flutter/presentation/common/custom_search.dart';
import 'package:mobx_flutter/presentation/custom/store_observer.dart';
import 'package:mobx_flutter/store/weather_store.dart';


@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreObserver(builder: (WeatherStore store, context) {
      final data = store.weatherList;
      print("${store.isThemeDark}");
      return Scaffold(
          appBar: AppBar( elevation: 0, actions: [
            IconButton(
                onPressed: () {
                 if(store.isThemeDark){
                   store.setTheme(false);
                 } else{
                   store.setTheme(true);
                 }

                  print("${store.isThemeDark}");
                },
                icon: Icon(
                  store.isThemeDark? Icons.sunny:Icons.nightlight_rounded,
                  color: Colors.amber,
                ))
          ]),
          body: Column(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: searchTextField(store),
                ),
                store.weatherList== null ?Container(child: Text("data not available"),) :
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(data.location?.name??"",
                                    style: TextStyle(
                                        fontSize: 50, fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${data.current?.temperature}°C",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.network("${data.current?.weatherIcons?[0]}")
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Humidity ${data.current?.humidity}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Date and Time ${data.location?.localtime}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Description ${data.current?.weatherDescriptions}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Wind Speed ${data.current?.windSpeed}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]));
    });
  }

  Widget searchTextField(WeatherStore store) {
    var value ="";
    return CustomSearch(
      hintText: "Search City",onTap: (){

    },
      onChanged: (String value) {
        store.getWeather(value);
      },
      controller: _searchController,
      onEvent: () {
        _searchController.clear();
      },
    );
  }
}
