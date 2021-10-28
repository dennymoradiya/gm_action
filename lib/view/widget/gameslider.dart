// ignore_for_file: file_names, avoid_print
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ActionGame/controller/category_controller.dart';
import 'package:ActionGame/controller/favarite_controller.dart';
import 'package:ActionGame/controller/topgame_controller.dart';
import 'package:ActionGame/model/hive_favarite.dart';
import 'package:ActionGame/view/screen/Topgame_webview.dart';
import 'package:ActionGame/view/screen/game_landing.dart';
import 'package:hive/hive.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

class GameSlider extends StatefulWidget {
  const GameSlider({Key? key}) : super(key: key);

  @override
  _GameSliderState createState() => _GameSliderState();
}

Topgamecontroller controller = Get.put(Topgamecontroller());
categorygamecontroller categorycontroller = Get.put(categorygamecontroller());
favaritecontroller favarite_controller = Get.put(favaritecontroller());

class _GameSliderState extends State<GameSlider> {
  @override
  void initState() {
    super.initState();
    categorycontroller.fetchcategorygame();
    controller.fetchtopgame();
    UnityAds.init(
      gameId: "4424597",
      
    );
  }

  void loadVideoAd() async {
    UnityAds.isReady(placementId: "Rewarded_Android").then((value) {
      if (value == true) {
        UnityAds.showVideoAd(
            placementId: "Rewarded_Android",
            listener: (state, args) {
              if (state == UnityAdState.complete) {
                print("VIDEO IS COMPLETED");
              } else if (state == UnityAdState.skipped) {
                print("VIDEO IS SKIPPED");
              }
            });
      } else {
        print("AD IS NOT READY");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return Obx(
      () => (categorycontroller.isload.value
          ? CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverToBoxAdapter(
                    child: CarouselSlider.builder(
                  itemCount: controller.isload.value
                      ? controller.topgamelist.length
                      : 10,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return InkWell(
                      onTap: () {
                        loadVideoAd();
                        Get.to(Gamelanding(
                          desc: controller.topgamelist[itemIndex].description,
                          icon: "https://kurminfotech.in/gamemania/" +
                              controller.topgamelist[itemIndex].icon,
                          img: "https://kurminfotech.in/gamemania/" +
                              controller.topgamelist[itemIndex].image,
                          name: controller.topgamelist[itemIndex].name,
                          website: controller.topgamelist[itemIndex].website,
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Obx(() => controller.isload.value
                                    ? Image.network(
                                        "https://kurminfotech.in/gamemania/" +
                                            controller
                                                .topgamelist[itemIndex].image,
                                        fit: BoxFit.cover,
                                        height: 1000,
                                        width: 1000.0)
                                    : const Center(
                                        child: CircularProgressIndicator())),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                      // ignore: prefer_const_constructors
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      child: Obx(
                                        () => controller.isload.value
                                            ? Text(
                                                controller
                                                    .topgamelist[itemIndex]
                                                    .name,

                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                " Loading...",

                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      )),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    height: 230,
                    enlargeCenterPage: true,
                  ),
                )),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                     

                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            loadVideoAd();
                            Get.to(Gamelanding(
                              desc: categorycontroller
                                  .categoryamelist[index].description,
                              icon: "https://kurminfotech.in/gamemania/" +
                                  categorycontroller
                                      .categoryamelist[index].icon,
                              img: "https://kurminfotech.in/gamemania/" +
                                  categorycontroller
                                      .categoryamelist[index].image,
                              name: categorycontroller
                                  .categoryamelist[index].name,
                              website: categorycontroller
                                  .categoryamelist[index].website,
                            )

                                // TopgameWebView(
                                //   weblink: categorycontroller
                                //       .categoryamelist[index].website)

                                );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 250,
                                width: 250,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14.0)),
                                ),
                                child: Obx(() => categorycontroller.isload.value
                                    ? FittedBox(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.network(
                                            "https://kurminfotech.in/gamemania/" +
                                                categorycontroller
                                                    .categoryamelist[index]
                                                    .icon,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            width: 50,
                                          ),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator())),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: () async {

                                    if (favarite_controller.favaritelist
                                        .contains(categorycontroller
                                            .categoryamelist[index].id)) {
                                      final box = Hive.box<DataModel>(
                                          'favaritegamebox');
                                      box.delete(categorycontroller
                                          .categoryamelist[index].id);

                                      favarite_controller.favaritelist.remove(
                                          categorycontroller
                                              .categoryamelist[index].id);
                                    // print("list from slider delete ${favarite_controller.favaritelist}");
                                    } else {
                                     

                                      DataModel addfavaritegame = new DataModel(
                                        catname: "Action",
                                        description: categorycontroller
                                            .categoryamelist[index].description,
                                        icon: categorycontroller
                                            .categoryamelist[index].icon,
                                        id: categorycontroller
                                            .categoryamelist[index].id
                                            .toString(),
                                        name: categorycontroller
                                            .categoryamelist[index].name,
                                        rating: categorycontroller
                                            .categoryamelist[index].rating,
                                        website: categorycontroller
                                            .categoryamelist[index].website,

                                      );
                                      var box = await Hive.openBox<DataModel>(
                                          'favaritegamebox');
                                      box.put(
                                          categorycontroller
                                              .categoryamelist[index].id,
                                          addfavaritegame);

                                      favarite_controller.favaritelist.add(
                                          categorycontroller
                                              .categoryamelist[index].id);
                                      
                                      //  print(
                                      //     "list from slider add ${favarite_controller.favaritelist}");
                                    }
                                  },
                                  child: Obx(
                                    () => (favarite_controller.favaritelist
                                            .contains(categorycontroller
                                                .categoryamelist[index].id))
                                        ? Icon(
                                            Icons.favorite_sharp,
                                            color: Colors.red,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.favorite_outline_sharp,
                                            color: Colors.red ,
                                            size: 30,
                                          ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 40,
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(0, 0, 0, 0),
                                        Color.fromARGB(150, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 3.0),
                                  child: Obx(
                                    () => categorycontroller.isload.value
                                        ? Text(
                                            categorycontroller
                                                .categoryamelist[index].name,
                                            textAlign: TextAlign.center,
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : const Text(
                                            "Loding...",
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                      childCount: controller.isload.value
                          ? categorycontroller.categoryamelist.length
                          : null),
                )
              ],
            )
          : Center(child: CircularProgressIndicator())),
    );
  }
}
