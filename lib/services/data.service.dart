import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/models/language.model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DataService extends GetxController {
  List<LanguageData> languageList = <LanguageData>[];
  List<LanguageData> inAppLanguageList = <LanguageData>[];

  Future<bool> getInAppLanguageList() async {
    var resp = await ApiCall.get("${UrlApi.getInAppLanguage}?encryption=false");

    LanguageModel languageModel = LanguageModel.fromJson(resp);

    if (languageModel.responseCode == 200) {
      inAppLanguageList.clear();
      inAppLanguageList.addAll(languageModel.data ?? []);
    }
    return true;
  }


  // This was used in the language drop down option inside the language drop down component
  LanguageData getLanguageObject({required String value}) {
    LanguageData languagesData = LanguageData(language: '', id: '');
    languagesData = languageList.firstWhere(
        (element) => element.language == value,
        orElse: () => languagesData);
    if (languagesData.language!.isEmpty) {
      languagesData = languageList.firstWhere((element) => element.id == value,
          orElse: () => languagesData);
    }
    return languagesData;
  }
}
