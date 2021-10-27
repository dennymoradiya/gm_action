import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ActionGame/controller/favarite_controller.dart';
import 'package:ActionGame/model/hive_favarite.dart';
import 'package:ActionGame/view/screen/Topgame_webview.dart';
import 'package:ActionGame/view/screen/game_landing.dart';
import 'package:hive/hive.dart';


class FavoriteGameScreen extends StatefulWidget {
  const FavoriteGameScreen({Key? key}) : super(key: key);

  @override
  _FavoriteGameScreenState createState() => _FavoriteGameScreenState();
}

class _FavoriteGameScreenState extends State<FavoriteGameScreen> {
  favaritecontroller favoriteController = Get.put(favaritecontroller());
  List<DataModel> datalist = [];
  void getData() async {
     final box = Hive.box<DataModel>('favaritegamebox');
    setState(() {
      
    datalist = box.values.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datalist.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Get.to(Gamelanding(
                          desc:  datalist[index].description,
                        icon:"https://kurminfotech.in/gamemania/" + datalist[index].icon,
                        img:"https://kurminfotech.in/gamemania/" + datalist[index].icon,
                        name: datalist[index].name,
                        website: datalist[index].website,
                        )
                          );
                      },
                      child: Image.network(
                        "https://kurminfotech.in/gamemania/" +
                            datalist[index].icon,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.27,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(100, 0, 0, 0),
                                Color.fromARGB(100, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            datalist[index].name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}