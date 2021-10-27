import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_action/model/category_game.dart';
import 'package:gm_action/model/hive_favarite.dart';
import 'package:gm_action/view/screen/Favarite_screen.dart';
import 'package:gm_action/view/screen/Home_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'controller/favarite_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>('favaritegamebox');
  favaritecontroller favarite_controller = Get.put(favaritecontroller());
  favarite_controller.getFavlist();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () => Get.off(() => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   primarySwatch: Colors.purple,
      // ),
      debugShowCheckedModeBanner: false,
      title: 'GM - Action Game',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Text(
                  "GM - Action Game",
                  style: TextStyle(
                    color: Colors.redAccent,
                    overflow: TextOverflow.fade,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}