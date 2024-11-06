import 'package:flutter/material.dart';

import '../../../components/testCard/testCard.component.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) => TestCardComponent(isLive: false,),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
    );
  }
}