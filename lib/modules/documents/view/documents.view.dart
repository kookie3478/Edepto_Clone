import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        title: "Documents",
        titleShown: true,
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          children: List.generate(10, (index) {
            return MaterialButton(
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AssetsUtil.getPhotoForDocumentsView(),
                          height: 103,
                          width: 77,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Economics".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              AssetsUtil.getFrameForDocumentsView(),
                              height: 13,
                              width: 13,
                              fit: BoxFit.contain,
                              color: context.theme.colorScheme.outline,
                            ),
                            Text(
                              "06 Pages".tr,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colorScheme.outline),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.timer_outlined, size: 13, color: context.theme.colorScheme.outline,),
                            Text("48 Mins".tr, style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: context.theme.colorScheme.outline,
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
