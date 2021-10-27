import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

import 'package:unity_ads_plugin/unity_ads.dart';
import 'package:gm_action/view/screen/Topgame_webview.dart';

class Gamelanding extends StatefulWidget {
  final img, name, icon, desc, website;
  Gamelanding(
      {Key? key, this.img, this.name, this.icon, this.desc, this.website})
      : super(key: key);

  @override
  _GamelandingState createState() => _GamelandingState();
}

class _GamelandingState extends State<Gamelanding> {
  @override
  void initState() {
    UnityAds.init(
      gameId: "4125684",
      testMode: true,
    );
  }

  void loadVideoAd() async {
    UnityAds.isReady(placementId: "Video_Android").then((value) {
      if (value == true) {
        UnityAds.showVideoAd(
            placementId: "Video_Android",
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
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(widget.img),
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                widget.icon,
                height: 150,
                width: 150,
              )),
          Text(
            widget.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, overflow: TextOverflow.fade),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ButtonTheme(
              minWidth: 200.0,
              height: 60.0,
              child: RaisedButton(
                child: Text(
                  "Start Game",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {loadVideoAd();
                  // Get.to(TopgameWebView(
                  //   weblink: widget.website,
                  // ));
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          UnityBannerAd(
              placementId: "Banner_Android",
            ),
        ],
      ),
    );
  }
}
