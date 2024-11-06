import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        titleShown: true,
        title: "Video",
      ),
      body: ListView.separated(itemBuilder: (context, index)=>Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              AssetsUtil.getPhotoForVideoView(),
              width: 92,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Economics Test 1".tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 10,
                          color: context.theme.colorScheme.outline,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "08:25 Min".tr,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.play_circle_filled, size: 28, color: context.theme.colorScheme.primary,)
          ],
        ),
      ),itemCount: 10, separatorBuilder: (context, index)=>const SizedBox(height: 10,),

      ),
    );
  }
}
