import 'package:flutter/material.dart';
import '../../../model/languages.dart';

class RadioListLanguages extends StatefulWidget {
  const RadioListLanguages(this.deviceInfo, this.selectLanguage, {super.key});
  final Map<String, String> deviceInfo;
  final Function selectLanguage;

  @override
  State<RadioListLanguages> createState() => _RadioListLanguagesState();
}

class _RadioListLanguagesState extends State<RadioListLanguages> {
  late String selectedLangCode = widget.deviceInfo["selectLangCode"]!;

  void getRearrangedLanguages() {
    List<Map<String, String>> rearrangedLanguages = [];
    List<Map<String, String>> restLanguages = [];

    String selectedLangCode = widget.deviceInfo["selectedLangCode"]!;
    String countryName = widget.deviceInfo["countryName"]!;

    for (var language in languages) {
      if (language["langCode"] == selectedLangCode) {
        rearrangedLanguages = [language, ...rearrangedLanguages];
      } else if (language["langName"]!.contains(countryName)) {
        rearrangedLanguages.add(language);
      } else {
        restLanguages.add(language);
      }
    }

    languages = [...rearrangedLanguages, ...restLanguages];
  }

  @override
  void initState() {
    getRearrangedLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String groupValue =
        "${widget.deviceInfo["selectedLangCode"]!}+${widget.deviceInfo["selectedLangName"]!}";

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return RadioListTile(
            value:
                "${languages[index]['langCode']}+${languages[index]['langNativeName']}",
            groupValue: groupValue,
            onChanged: (val) {
              List<String> temp = val!.split("+");
              setState(() {
                widget.deviceInfo["selectedLangCode"] = temp[0];
                widget.deviceInfo["selectedLangName"] = temp[1];
                widget.selectLanguage(temp[0], temp[1]);
              });
            },
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                languages[index]['langName'] as String,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                languages[index]['langCode'] ==
                        widget.deviceInfo["langDefaultCode"]!
                    ? "System's default language"
                    : languages[index]['langNativeName'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 12),
          );
        },
        childCount: languages.length,
      ),
    );
  }
}
