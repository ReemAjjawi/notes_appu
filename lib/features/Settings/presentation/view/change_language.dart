import 'package:flutter/material.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/resources/managers/assets_manager.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_list_tile.dart';
import '../../../../main.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  ValueNotifier<String> selectedLanguage = ValueNotifier<String>(StringsManager.ENGLISH);

  final List<Map<String, String>> languages = [
    {'Image': AssetsManager.englishImage, 'name': StringsManager.ENGLISH, 'hint': StringsManager.ENGLISH},
    {'Image': AssetsManager.hindiImage, 'name': StringsManager.HINDI, 'hint': StringsManager.HINDI},
    {'Image': AssetsManager.arabicImage, 'name': StringsManager.ARABIC, 'hint': StringsManager.ARABIC},
    {'Image': AssetsManager.frenchImage, 'name': StringsManager.FRENCH, 'hint': StringsManager.FRENCH},
    {'Image': AssetsManager.germanImage, 'name': StringsManager.GERMAN, 'hint': StringsManager.GERMAN},
    {'Image': AssetsManager.portugueseImage, 'name': StringsManager.PORTUGUESE, 'hint': StringsManager.PORTUGUESE},
    {'Image': AssetsManager.turkishImage, 'name': StringsManager.TURKISH, 'hint': StringsManager.TURKISH},
    {'Image': AssetsManager.dutchImage, 'name': StringsManager.DUTCH, 'hint': StringsManager.DUTCH},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildListView(),
      bottomNavigationBar: _buildAppButton(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.CHARGELANGUAGE),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<String>(
      valueListenable: selectedLanguage,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return _buildListTile(index, value);
          },
        );
      },
    );
  }

  Widget _buildListTile(int index, String value) {
    bool isSelected = value == languages[index]['name']!;
    return Card(
      child: CustomListTile(
        hasrawsubtitle: false,
        hasrawtitle: false,
        hascolum: false,
        leading: Image(image: AssetImage(languages[index]['Image']!)),
        title: Text(
          languages[index]['name']!,
          style: StylesManager.titleTextStyle,
        ),
        subtitle: Text(
          languages[index]['hint']!,
          style: StylesManager.subTitleStyle,
        ),
        backgroundColor: ColorManager.whiteColor,
        borderColor: isSelected
            ? ColorManager.borderColor
            : ColorManager.subTitleNotificationColor,
        height: screenHeight * 0.1,
        width: screenWidth,
        trailing: Icon(
          Icons.check_circle,
          color: isSelected
              ? ColorManager.borderColor
              : ColorManager.subTitleNotificationColor,
        ),
        onTap: () {
          selectedLanguage.value = languages[index]['name']!;
        },
      ),
    );
  }

  Widget _buildAppButton() {
    return AppButton(
      text: StringsManager.SAVE,
      onPressed: () {},
      backgroundColor: ColorManager.primaryColor,
      width: isMobile ? screenWidth * 0.5 : screenWidth * 0.88,
      height: isMobile ? screenHeight / 12 : screenHeight / 15,
      textStyle: StylesManager.greenButtonStyle,
      hasIcon: false,
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}
