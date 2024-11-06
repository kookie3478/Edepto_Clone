import 'package:carousel_slider/carousel_controller.dart';
import 'package:edepto_app/modules/home/components/Home.moreLanguage.component.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CarouselSliderController carouselSliderController = CarouselSliderController();

  onMoreLanguage() {
    MoreLanguageComponent.show();
  }
}
