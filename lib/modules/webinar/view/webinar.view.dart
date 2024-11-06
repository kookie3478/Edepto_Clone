import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/widgetCard.component.dart';

class WebinarView extends StatelessWidget {
  const WebinarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        titleShown: true,
        title: "Webinar",
      ),
      body: ListView.separated(
        separatorBuilder: (context,index)=>const SizedBox(height: 10,),
        itemCount: 10,
        itemBuilder: (context,index)=>WidgetCard(),
      ),
    );
  }
}


