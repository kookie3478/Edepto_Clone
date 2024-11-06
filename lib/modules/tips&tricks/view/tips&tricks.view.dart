import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipsAndTricksView extends StatelessWidget {
  const TipsAndTricksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        titleShown: true,
        title: "Tips & Tricks",
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding:const EdgeInsets.all(10),
        children: List.generate(
          15,
          (index) {
            return MaterialButton(onPressed: (){},
              minWidth: 0,
              padding: EdgeInsets.zero,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      height: 82,
                      width: 82,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.outline,
                      ),
                      child: ClipOval(child: Image.asset(AssetsUtil.gettips1(), height: 75, width: 75, fit: BoxFit.contain,)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
