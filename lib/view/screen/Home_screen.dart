import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ActionGame/api/topgame_connection.dart';
import 'package:ActionGame/controller/getcontroller.dart';
import 'package:ActionGame/model/top_gamemodel.dart';
import 'package:ActionGame/view/screen/Favarite_screen.dart';
import 'package:ActionGame/view/widget/drawer.dart';
import 'package:ActionGame/view/widget/gameslider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    controller.checkinternet();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() => controller.isinternetconnect.value
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                "Action Game",
                style: TextStyle(fontSize: 23),
              ),
              centerTitle: true,
            ),
            drawer: const Drawerbar(),
            body: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => controller.currentIndex.value = index);
                },
                children: <Widget>[
                  GameSlider(),
                  FavoriteGameScreen(),
                ],
              ),
            ),
            bottomNavigationBar: Obx(
              () => BottomNavyBar(
                selectedIndex: controller.currentIndex.value,
                onItemSelected: (index) {
                  controller.currentIndex.value = index;
                  _pageController.jumpToPage(index);
                },
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    activeColor: Colors.blue,
                  ),
                  BottomNavyBarItem(
                      icon: Icon(Icons.favorite),
                      title: Text('Favorite'),
                      activeColor: Colors.green),
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator()));
  }
}
