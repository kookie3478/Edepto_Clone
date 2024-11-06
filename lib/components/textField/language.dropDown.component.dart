import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/language.model.dart';
import '../../services/data.service.dart';

class LanguageDropDownComponent extends StatelessWidget {
  const LanguageDropDownComponent({
    super.key,
    required this.onChanged,
    required this.dropdownValue,
    required this.hintText,
    this.editable = true,
    this.languageList = const [],
    this.height = 50,
    this.contentPadding = 15,
  });
  final Function(LanguageData?) onChanged;
  final String dropdownValue;
  final String hintText;
  final bool editable;
  final List<LanguageData> languageList;
  final double height;
  final double contentPadding;

  @override
  Widget build(BuildContext context) {
    List<LanguageData> languageListFinal = [];
    if (languageList.isEmpty) {
      languageListFinal = Get.find<DataService>().languageList;
    } else {
      languageListFinal = languageList;
    }
    return SizedBox(
      height: height,
      child: DropdownSearch<LanguageData>(
          enabled: editable,
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            fit: FlexFit.loose,
            constraints: const BoxConstraints(minHeight: 0, maxHeight: 210),
            itemBuilder: (context, languageData, isSelected) => Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                languageData.language!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? context.theme.colorScheme.primary
                      : context.theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
          dropdownButtonProps: DropdownButtonProps(
            icon: const Icon(Icons.expand_more_rounded),
            iconSize: 16,
            color: context.theme.colorScheme.outline,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
          ),
          items: languageListFinal,
          onChanged: onChanged,
          selectedItem: Get.find<DataService>().getLanguageObject(value: dropdownValue.tr),
          compareFn: (item, selectedItem) => item.id == selectedItem.id,
          dropdownBuilder: (sContext, languageData) {
            if (languageData!.language!.isEmpty) {
              return SizedBox(
                width: double.infinity,
                child: Text(
                  hintText.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: sContext.theme.colorScheme.outline,
                  ),
                ),
              );
            }
            return SizedBox(
              width: double.infinity,
              child: Text(
                languageData.language!.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: editable
                      ? context.theme.colorScheme.onSurface
                      : context.theme.colorScheme.outline,
                ),
              ),
            );
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: editable
                  ? context.theme.colorScheme.onSurface
                  : context.theme.colorScheme.outline,
            ),
            dropdownSearchDecoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(contentPadding),
              filled: true,
              fillColor: context.theme.colorScheme.primaryContainer,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                borderSide:
                    BorderSide(color: context.theme.colorScheme.primary),
              ),
            ),
          ),
        ),
    );
  }
}

