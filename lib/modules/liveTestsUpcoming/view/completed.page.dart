import 'package:edepto_app/components/testCard/resultCard.component.dart';
import 'package:flutter/material.dart';

import '../../../components/testCard/testCard.component.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) => ResultCardComponent(),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
    );
  }
}
