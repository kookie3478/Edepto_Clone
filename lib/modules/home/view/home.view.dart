import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/modules/home/controller/home.controller.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/bottomNavBar.component.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  // static List<String>imgList=[
  //   'https://www.shutterstock.com/image-photo/graduation-cap-earth-globe-concept-260nw-2349898783.jpg',
  //   'https://www.shutterstock.com/image-photo/graduation-cap-earth-globe-concept-260nw-2349898783.jpg',
  //   'https://www.shutterstock.com/image-photo/graduation-cap-earth-globe-concept-260nw-2349898783.jpg',
  //   'https://www.shutterstock.com/image-photo/graduation-cap-earth-globe-concept-260nw-2349898783.jpg',
  //   'https://www.shutterstock.com/image-photo/graduation-cap-earth-globe-concept-260nw-2349898783.jpg',
  // ];

  // final List<Widget> imageSliders = imgList.map((item) => Container(
  //   child: Container(
  //     margin: EdgeInsets.all(5.0),
  //     child: ClipRRect(
  //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //         child: Stack(
  //           children: <Widget>[
  //             Image.network(item, fit: BoxFit.cover, width: 1000.0),
  //             Positioned(
  //               bottom: 0.0,
  //               left: 0.0,
  //               right: 0.0,
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [
  //                       Color.fromARGB(200, 0, 0, 0),
  //                       Color.fromARGB(0, 0, 0, 0)
  //                     ],
  //                     begin: Alignment.bottomCenter,
  //                     end: Alignment.topCenter,
  //                   ),
  //                 ),
  //                 padding: const EdgeInsets.symmetric(
  //                     vertical: 10.0, horizontal: 20.0),
  //               ),
  //             ),
  //           ],
  //         )),
  //   ),
  // ))
  //     .toList();

  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is the AppBar
      appBar: AppbarComponent.buildAppBar(
        titleShown: true,
        showDrawer: true,
      ),

      // This is the body
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Carousal Slider
              CarouselSlider.builder(
                carouselController: homeController.carouselSliderController,
                itemCount: 5,
                itemBuilder: (context, index, realIndex) => Container(
                  height: 80,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(AssetsUtil.carousalSlider()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                options: CarouselOptions(
                  height: 87,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                ),
              ),
              //Test icons
              SizedBox(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  separatorBuilder: (context, index) => Container(width: 10),
                  itemBuilder: (context, index) => SizedBox(
                    width: 50,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 0,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AssetsUtil.getSSCLogo(),
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "SSC JE/ ME/ CE",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.theme.colorScheme.outline,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Suggested + view all btn
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Suggested Test",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        overlayColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        minimumSize: WidgetStatePropertyAll(Size.zero),
                      ),
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // listview for suggested tests
              SizedBox(
                height: 230,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (context, index) => Container(width: 30),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) => Container(
                    height: 200,
                    width: 165,
                    padding: const EdgeInsets.all(10),
                    color: context.theme.colorScheme.primaryContainer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Container(
                              width: 30,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: context.theme.colorScheme.onPrimary,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                AssetsUtil.getSSCLogo(),
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "₹100".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: context.theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Dolorum quia quibusdam".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text(
                              "65 total".tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: context.theme.colorScheme.outline,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              color: context.theme.colorScheme.outline,
                            ),
                            const Text(
                              "2 free",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Hin,Eng".tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: context.theme.colorScheme.outline,
                              ),
                            ),
                            const SizedBox(width: 5),
                            MaterialButton(
                              onPressed: () => homeController.onMoreLanguage(),
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  color:
                                      context.theme.colorScheme.outlineVariant,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: context.theme.colorScheme.primary,
                                  size: 11,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 20,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                color: context.theme.colorScheme.onPrimary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    size: 14,
                                    color: context.theme.colorScheme.primary,
                                  ),
                                  Text(
                                    "126",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: context.theme.colorScheme.outline,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 0,
                          padding: EdgeInsets.zero,
                          highlightColor: Colors.white,
                          visualDensity: VisualDensity.standard,
                          splashColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.primary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                              "View Test".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: context.theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // enrolled + view all btn
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enrolled Test Series",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        overlayColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        minimumSize: WidgetStatePropertyAll(Size.zero),
                      ),
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Enrolled test series listview
              SizedBox(
                height: 150,
                child: ListView.separated(
                    separatorBuilder: (context, index) => Container(width: 10),
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          height: 122,
                          width: 150,
                          color: context.theme.colorScheme.primaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                // First element is a row with the icon box and a text
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // left most element of row having an icon within a container, so we used material button
                                    MaterialButton(
                                      onPressed: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      visualDensity: VisualDensity.compact,
                                      minWidth: 0,
                                      padding: const EdgeInsets.all(0),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: context
                                              .theme.colorScheme.onPrimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          AssetsUtil.getSSCLogo(),
                                          height: 30,
                                          width: 30,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),

                                    //Second item is a round progress bar
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: DashedCircularProgressBar(
                                        width: 30,
                                        height: 30,
                                        progress: 67,
                                        maxProgress: 100,
                                        backgroundColor: context.theme.colorScheme.onPrimary,
                                        foregroundColor: context.theme.colorScheme.primary,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "67%",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 38,
                                    width: 99,
                                    child: Text(
                                      "Velit est reiciendis",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: context.theme.colorScheme
                                            .onPrimaryContainer,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "65 total".tr,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            context.theme.colorScheme.outline,
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 1,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      color: context.theme.colorScheme.outline,
                                    ),
                                    Text(
                                      "24 attempt".tr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            ],
          ),
          // Footer(make a function and add it to view of other modules)
        ],
      ),
      //backgroundColor: CupertinoColors.white,
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBarComponent(
                text: "My Test",
                image: AssetsUtil.getMyTest(),
                onClick: () {},
              ),
              BottomNavBarComponent(
                text: "My Test",
                image: AssetsUtil.getMyTest(),
                onClick: () {},
              ),
              BottomNavBarComponent(
                text: "My Test",
                image: AssetsUtil.getMyTest(),
                onClick: () {},
              ),
              BottomNavBarComponent(
                text: "My Test",
                image: AssetsUtil.getMyTest(),
                onClick: () {},
              ),
              BottomNavBarComponent(
                text: "My Test",
                image: AssetsUtil.getMyTest(),
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


