import 'package:flutter/material.dart';
import 'app_language.dart';
import 'radio_language_list.dart';

class DraggableLanguageSheet extends StatefulWidget {
  const DraggableLanguageSheet(this.deviceInfo, this.selectLanguage,
      {super.key});
  final Map<String, String> deviceInfo;
  final Function selectLanguage;

  @override
  State<DraggableLanguageSheet> createState() => _DraggableLanguageSheetState();
}

class _DraggableLanguageSheetState extends State<DraggableLanguageSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onChanged() {
    var currentSize = controller.size;
    if (currentSize <= 0.05) {
      collapse();
    }
  }

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);
  void anchor() => animateSheet(getSheet.snapSizes!.last);
  void expand() => animateSheet(getSheet.maxChildSize);
  void hide() => animateSheet(getSheet.minChildSize);

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        return DraggableScrollableSheet(
          key: sheet,
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          minChildSize: 0.0,
          expand: false,
          snap: true,
          snapSizes: [60 / constraints.maxHeight, 0.5],
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 30,
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const AppLanguage(),
                  RadioListLanguages(widget.deviceInfo, widget.selectLanguage),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
